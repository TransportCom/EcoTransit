//
//  StationsModel.swift
//  EcoTransit
//
//  Created by imba on 16/11/2023.
//
//  StationsModel.swift
//  EcoTransit
//
//  Created by imba on 16/11/2023.
import MapKit

struct Cordinates : Codable {
    let lan: Double
    let lat : Double
}

struct StationsModel: Identifiable, Hashable, Equatable, Decodable {
    let id = UUID()
    let title: String
    let coordinates: Cordinates
    func hash(into hasher: inout Hasher) {
            hasher.combine(id)
        }

        static func == (lhs: StationsModel, rhs: StationsModel) -> Bool {
            return lhs.id == rhs.id
        }
}

struct TripModel: Identifiable {
    let id = UUID()
    let date: Date
    var startStation: StationsModel
    let endStation: StationsModel
 
}

struct fetchStationsResponse : Decodable  {
    let stations : [StationsModel]
    let message : String
    let statusCode : Int
}

// Example function to assign trips to stations
func assignTripsToStations() {
    var station1 = StationsModel(title: "Station A", coordinates: Cordinates(lan: 37.7749, lat: -122.4194) )
    var station2 = StationsModel(title: "Station B", coordinates: Cordinates(lan: 37.7749, lat: -122.4194) ) //trips: []

    let trip1 = TripModel(date: Date(), startStation: station1, endStation: station2)
    let trip2 = TripModel(date: Date(), startStation: station2, endStation: station1)


    // Assign trips to stations
   // station1.trips.append(contentsOf: [trip1, trip2])
    //station2.trips.append(contentsOf: [trip1, trip2])

    // You can use or print the stations and their associated trips here
    print(station1)
    print(station2)
}


