//
//  MapViewRepresentable.swift
//  EcoTransit
//
//  Created by imba on 4/11/2023.
//

import SwiftUI
import MapKit

struct MapViewRepresentable: UIViewRepresentable{
    
    let mapView = MKMapView()
    let locationManager = LocationManager()
    @EnvironmentObject var locationViewModel  : LocationSearchViewModel

    func makeUIView(context: Context) -> some UIView {
       
        mapView.delegate = context.coordinator
        mapView.isRotateEnabled = false
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .follow
        
        return mapView
    }//creation of map view
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        if let coordinate = locationViewModel.selectedLocationCoordinate {
            context.coordinator.addAndSelectAnnotation(withCoordinate: coordinate)
            context.coordinator.configurePolyline(withDestinationCoordinate: coordinate)
            
        }
        
    }
    
    func makeCoordinator () -> MapCoordinator {
        return MapCoordinator(parent: self)
    }
}
extension MapViewRepresentable {
    class MapCoordinator: NSObject, MKMapViewDelegate {
        let parent: MapViewRepresentable
        var userLocationCoordinate: CLLocationCoordinate2D?
        init (parent: MapViewRepresentable) {
            self.parent = parent
            super.init ()
        }
        
        func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
            self.userLocationCoordinate = userLocation.coordinate
            let region = MKCoordinateRegion (
                center: CLLocationCoordinate2D(latitude: userLocation.coordinate.latitude,
                    longitude: userLocation.coordinate.longitude),
                span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
            )
            parent.mapView.setRegion(region, animated: true)
        }
        
        
        
         func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
            let polyline = MKPolylineRenderer(overlay: overlay)
            polyline.strokeColor = .systemGreen
            polyline.lineWidth = 6
            return polyline
        }

        
        

        
        
        func addAndSelectAnnotation(withCoordinate coordinate: CLLocationCoordinate2D) {
            parent.mapView.removeAnnotations(parent.mapView.annotations)
            let anno = MKPointAnnotation()
            anno.coordinate = coordinate
            parent.mapView.addAnnotation(anno)
            parent.mapView.selectAnnotation (anno, animated: true)
                 parent.mapView.showAnnotations(parent.mapView.annotations, animated:true )
        }
        
        func configurePolyline (withDestinationCoordinate coordinate: CLLocationCoordinate2D)
        { guard let userLocationCoordinate = self.userLocationCoordinate else { return }
         getDestinationRoute(from: userLocationCoordinate, to: coordinate )
            { route in
                self.parent.mapView.addOverlay(route.polyline)}
        }
        
        func getDestinationRoute(from userLocation: CLLocationCoordinate2D,
        to destination: CLLocationCoordinate2D, completion:
        @escaping(MKRoute) -> Void) {
        let userPlacemark = MKPlacemark (coordinate: userLocation)
        let destPlacemark = MKPlacemark (coordinate: destination)
        let request = MKDirections .Request ()
        request.source = MKMapItem(placemark: userPlacemark)
        request.destination = MKMapItem(placemark: destPlacemark)
        let directions = MKDirections (request: request)
            
            directions.calculate { response, error in
        if let error = error {
        print ("DEBUG: Failed to get directions with error\(error .localizedDescription)")
        return
        }
        guard let route = response?.routes.first else { return }
        completion (route)
        }
        }
        }
    }
