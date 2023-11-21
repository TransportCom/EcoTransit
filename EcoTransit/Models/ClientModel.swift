//
//  ClientModel.swift
//  EcoTransit
//
//  Created by imba on 14/11/2023.
///
//  Driver.swift
//  EcoTransit
//
//  Created by imba on 9/11/2023.
//

import Foundation
struct ClientModel {
    var id: Int
    var name: String
    var location: String
    var coordinates : Cordinates
    var imageName: String
    var description: String
   
   
}
let allClientss: [ClientModel] = [
    ClientModel(id: 1, name: "John Doe", location: "City Center", coordinates: Cordinates(lan: 0, lat: 0), imageName: "driver1", description: "Experienced driver")
]




