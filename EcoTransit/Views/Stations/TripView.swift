//
//  TripView.swift
//  EcoTransit
//
//  Created by imba on 16/11/2023.
//
import SwiftUI
import MapKit

struct TripView: View {
    let station: StationsModel

    var body: some View {
        VStack {
            Text("Trips for \(station.title)")
                .font(.title)
                .padding()

            List {
                ForEach(staticTrips, id: \.startStation) { trip in
                    NavigationLink(destination: TripDetailsView(trip: trip)) {
                        Text("Trip on \(trip.date)")
                    }
                }
            }
        }
        .navigationBarTitle("Trips")
    }
}

struct TripDetailsView: View {
    let trip: TripModel

    var body: some View {
        VStack {
            Text("Details for trip on \(trip.date)")
                .font(.title)
                .padding()

            // Display other details about the trip
        }
        .navigationBarTitle("Trip Details")
    }
}

// Example of static trips
let staticTrips: [TripModel] = [
    TripModel(date: Date(), startStation: StationsModel(title: "Start Station 1", coordinates: Cordinates(lan: 11.7, lat: 36.5)), endStation: StationsModel(title: "End Station 2", coordinates: Cordinates(lan: 11.7, lat: 36.7))),
    TripModel(date: Date(), startStation: StationsModel(title: "Start Station 2", coordinates: Cordinates(lan: 11.7, lat: 36.1)), endStation: StationsModel(title: "End Station 1", coordinates: Cordinates(lan: 11.7, lat: 36.5)))
]

struct TripView_Previews: PreviewProvider {
    static var previews: some View {
        let station = StationsModel(title: "Sample Station", coordinates: Cordinates(lan: 0, lat: 0))
        return TripView(station: station)
    }
}
