//
//  MapViewRepresentable.swift
//  EcoTransit
//
//  Created by imba on 4/11/2023.
//

import SwiftUI
import MapKit
import CoreLocation


struct MapViewRepresentable: UIViewRepresentable {
    let mapView = MKMapView()
    let locationManager = LocationManager()
    @Binding var mapState: MapViewState
    @EnvironmentObject var locationViewModel: LocationSearchViewModel
    @ObservedObject var dataModel : DataModel
    let stationViewModel : StationViewModel


    func makeUIView(context: Context) -> some UIView {
        mapView.delegate = context.coordinator
        mapView.isRotateEnabled = false
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .follow
        return mapView
    }

    func updateUIView(_ uiView: UIViewType, context: Context)  {
        print("DEBUG: map state is \(mapState)")
        switch mapState {
        case .noInput:
            context.coordinator.clearMapViewAndRecenterOnUserLocation()
            break
        case .searchingForLocation:
            break
        case .loctionSelected:
            break
        case .busSelected:
            if let coordinate = locationViewModel.selectedLocationCoordinate {
                context.coordinator.fetchIterinary(toCoordinate:coordinate)
                DispatchQueue.main.asyncAfter(deadline: .now()+3, execute: {
                    mapState = .iterinaryDisplayed
                })
            }
            break
        case .taxiSelected:
            if let coordinate = locationViewModel.selectedLocationCoordinate {
                print("DEBUG: coordinate is \(coordinate)")
                context.coordinator.addAndSelectAnnotation(withCoordinate: coordinate)
                DispatchQueue.main.asyncAfter(deadline: .now()+3, execute: {
                    mapState = .iterinaryDisplayedTaxi
                })
            }

            break
        case .iterinaryDisplayed,.iterinaryDisplayedTaxi:
            break
        }
    }

    func makeCoordinator() -> MapCoordinator {
        return MapCoordinator(parent: self)
    }
}

extension MapViewRepresentable {
    class MapCoordinator: NSObject, MKMapViewDelegate {
        let parent: MapViewRepresentable
        var userLocationCoordinate: CLLocationCoordinate2D?
        var  currentRegion: MKCoordinateRegion?
        init(parent: MapViewRepresentable) {
            self.parent = parent
            super.init()
        }

        func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
            self.userLocationCoordinate = userLocation.coordinate
            let region = MKCoordinateRegion(
                center: CLLocationCoordinate2D(
                    latitude: userLocation.coordinate.latitude,
                    longitude: userLocation.coordinate.longitude
                ),
                span: MKCoordinateSpan(latitudeDelta: 0.9, longitudeDelta: 0.9)
            )
            self.currentRegion = region
            parent.mapView.setRegion(region, animated: true)
        }

        func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
            if let polyline = overlay as? MKPolyline {
                       let renderer = MKPolylineRenderer(overlay: polyline)

                       // Check the title to determine which polyline this is and set the color accordingly
                       if polyline.title == "Polyline" {
                           renderer.strokeColor = .systemBlue
                       } else if polyline.title == "Walk" {
                           renderer.strokeColor = .systemGreen
                       }
                       // Add more conditions for additional polylines

                       renderer.lineWidth = 6
                       return renderer
                   }

                   return MKOverlayRenderer(overlay: overlay)
       
        }

        func fetchIterinary(toCoordinate coordinate: CLLocationCoordinate2D)  {
            parent.mapView.removeAnnotations(parent.mapView.annotations)
            parent.stationViewModel.fetchIterinary(id:"654c9759c0897c447536ab08" , fromLocation: Cordinates(lan: userLocationCoordinate?.longitude ?? 0, lat: userLocationCoordinate?.latitude ?? 0), toLocation: Cordinates(lan: coordinate.longitude, lat: coordinate.latitude))
            DispatchQueue.main.asyncAfter(deadline: .now()+1, execute: {
                
                self.parent.locationViewModel.fromStation = self.parent.stationViewModel.fromStation
                self.parent.locationViewModel.toStation = self.parent.stationViewModel.toStation
                
                let anno = MKPointAnnotation()
                anno.coordinate = coordinate
                
                let fromAnno = MKPointAnnotation()
                fromAnno.coordinate = CLLocationCoordinate2D(latitude: self.parent.stationViewModel.fromStation.coordinates.lat, longitude: self.parent.stationViewModel.fromStation.coordinates.lan)
                
                let toAnno = MKPointAnnotation()
                toAnno.coordinate = CLLocationCoordinate2D(latitude: self.parent.stationViewModel.toStation.coordinates.lat, longitude: self.parent.stationViewModel.toStation.coordinates.lan)
                 
                self.parent.mapView.addAnnotation(anno)
                self.parent.mapView.addAnnotation(fromAnno)
                self.parent.mapView.addAnnotation(toAnno)
                self.configurePolyline(withDestinationCoordinate: toAnno.coordinate, fromStation: fromAnno.coordinate,title:"Polyline")
                self.configurePolyline(withDestinationCoordinate: fromAnno.coordinate, fromStation: CLLocationCoordinate2D(latitude: self.userLocationCoordinate?.latitude ?? 0, longitude: self.userLocationCoordinate?.longitude ?? 0),title:"Walk")
                self.configurePolyline(withDestinationCoordinate: anno.coordinate, fromStation: toAnno.coordinate,title:"Walk")
                self.parent.mapView.selectAnnotation(anno, animated: true)
                self.parent.mapView.showAnnotations(self.parent.mapView.annotations, animated: true)
            })
            

            
        }
        
        func addAndSelectAnnotation(withCoordinate coordinate: CLLocationCoordinate2D) {
            parent.mapView.removeAnnotations(parent.mapView.annotations)
            
            
            let anno = MKPointAnnotation()
            anno.coordinate = coordinate
            parent.mapView.addAnnotation(anno)
            parent.mapView.selectAnnotation(anno, animated: true)
            parent.mapView.showAnnotations(parent.mapView.annotations, animated: true)
            self.configurePolyline(withDestinationCoordinate: anno.coordinate, fromStation: CLLocationCoordinate2D(latitude: self.userLocationCoordinate?.latitude ?? 0, longitude: self.userLocationCoordinate?.longitude ?? 0),title:"Polyline")


        }

        func configurePolyline(withDestinationCoordinate coordinate: CLLocationCoordinate2D, fromStation:CLLocationCoordinate2D, title: String ) {
            guard let userLocationCoordinate = self.userLocationCoordinate else { return }
            getDestinationRoute(from: fromStation, to: coordinate) { route in
                route.polyline.title = title
                self.parent.mapView.addOverlay(route.polyline)
                let rect = self.parent.mapView.mapRectThatFits(route.polyline.boundingMapRect,
                                                            edgePadding: .init(top:64, left: 32, bottom: 500,right: 32))
                self.parent.mapView.setRegion(MKCoordinateRegion(rect), animated: true)
            }
        }

        func getDestinationRoute(
            from userLocation: CLLocationCoordinate2D,
            to destination: CLLocationCoordinate2D,
            completion: @escaping (MKRoute) -> Void
        ) {
            let userPlacemark = MKPlacemark(coordinate: userLocation)
            let destPlacemark = MKPlacemark(coordinate: destination)
            let request = MKDirections.Request()
            request.source = MKMapItem(placemark: userPlacemark)
            request.destination = MKMapItem(placemark: destPlacemark)
            let directions = MKDirections(request: request)
            let locationManager = CLLocationManager()
            locationManager.requestAlwaysAuthorization()
            directions.calculate { response, error in
                if let error = error {
                    print("DEBUG: Failed to get directions with error \(error.localizedDescription)")
                    return
                }
                guard let route = response?.routes.first else { return }
                completion(route)
            }
        }
        func clearMapViewAndRecenterOnUserLocation(){
            parent.mapView.removeAnnotations(parent.mapView.annotations)
            parent.mapView.removeOverlays(parent.mapView.overlays)
            if let currentRegion = currentRegion {
                parent.mapView.setRegion(currentRegion, animated: true)
            }
        }
        }
    }

