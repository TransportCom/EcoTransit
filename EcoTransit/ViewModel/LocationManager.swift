//
//  LocationManager.swift
//  EcoTransit
//
//  Created by imba on 4/11/2023.
//

import CoreLocation
class LocationManager: NSObject, ObservableObject {
private let locationManager = CLLocationManager ()
    
override init() {
    super.init()
    locationManager.delegate = self
locationManager.desiredAccuracy = kCLLocationAccuracyBest
locationManager.requestWhenInUseAuthorization()
locationManager.startUpdatingLocation()
}
}
extension LocationManager: CLLocationManagerDelegate {
func locationManager (_ manager: CLLocationManager, didUpdateLocations locations:
[CLLocation]) {
    guard !locations.isEmpty else { return }
    //print(locations.first)
locationManager.stopUpdatingLocation()
    
}
    
}