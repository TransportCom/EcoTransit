//
//  Station.swift
//  EcoTransit
//
//  Created by imba on 15/11/2023.
//

import SwiftUI
import MapKit
import Foundation

struct Station: Identifiable {
    var id = UUID()
    var name: String
    var coordinate: CLLocationCoordinate2D
}
