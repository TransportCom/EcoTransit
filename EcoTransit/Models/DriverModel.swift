//
//  Driver.swift
//  EcoTransit
//
//  Created by imba on 9/11/2023.
//

import Foundation
struct DriverModel {
    var id: Int
    var name: String
    var location: String
    var imageName: String
    var description: String
    var reviews: String
    var rideType: RideType
   
}
let allDrivers: [DriverModel] = [
    DriverModel(id: 1, name: "John Doe", location: "City Center", imageName: "driver1", description: "Experienced driver", reviews: "5 stars", rideType: .taxi),
    DriverModel(id: 2, name: "Jane Smith", location: "Suburb", imageName: "driver2", description: "Friendly driver", reviews: "4.5 stars", rideType: .bus),
    // Add more drivers with different ride types
]



