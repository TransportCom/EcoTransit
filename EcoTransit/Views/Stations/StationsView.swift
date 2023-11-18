//
//  StationsView.swift
//  EcoTransit
//
//  Created by imba on 15/11/2023.
//
import SwiftUI
import MapKit

struct StationsView: View {
    // Store the map's currently visible rect
    @State private var visibleRect = MKMapRect(x: 125_000_000, y: 75_000_000, width: 15_000_000, height: 25_000_000)
    @StateObject var stationViewModel : StationViewModel


    // Dummy data
    @State private var items: [StationsModel] = [
     
        .init(title: "Station1", coordinates: Cordinates(lan: 10, lat: 36.5)),
        .init(title: "Station2", coordinates: Cordinates(lan: 10.2, lat: 36.7)),
]


    // State to track the selected station for the sheet
    @State private var selectedStation: StationsModel?

    var body: some View {
        
        Map(mapRect: $visibleRect, annotationItems: stationViewModel.stations) { item in
            MapMarker(coordinate: CLLocationCoordinate2D(latitude: item.coordinates.lat, longitude: item.coordinates.lan))
        }
        .ignoresSafeArea()
        .onAppear {
            stationViewModel.fetchStations()
        }.overlay {
            if items.isEmpty {
                // You can show a loading indicator or placeholder here
                Text("Loading Stations...")
            }
        }
        .overlay(alignment: .bottom) {
            let stations = visibleStations()

            // Show the list of visible stations if there are any
            if !stations.isEmpty {
                HStack {
                    ForEach(stations) { item in
                        Button(action: {
                            // Handle the action for each item
                            selectedStation = item
                        }) {
                            Text(item.title)
                               
                                .foregroundColor(.white)
                        }
                        .padding(10)
                        .background(
                            GeometryReader { geometry in
                                Color.green.opacity(0.6)
                                    .frame(width: geometry.size.width)
                                    .cornerRadius(10)
                            }
                        )
                        .sheet(item: $selectedStation) { station in
                            // Show your station information sheet here
                            StationInfoView(station: station)
                          .transition(.move(edge: .bottom))

                        }
                    }
                }
                .padding()
            }

            }
    }

    func visibleStations() -> [StationsModel] {
        stationViewModel.stations.filter { item in
            // Check if the item's location is in the map's currently visible rect
            visibleRect.contains(.init(CLLocationCoordinate2D(latitude: item.coordinates.lat, longitude: item.coordinates.lan)))
        }
    }
}

struct StationsView_Previews: PreviewProvider {
    static var previews: some View {
        StationsView(stationViewModel: StationViewModel())
    }
}

struct StationInfoView: View {
    let station: StationsModel

    var body: some View {
    
            
        NavigationStack {
            VStack {
                        Capsule()
                            .foregroundColor (Color(.systemGray5))
                            .frame(width: 48, height: 6)
                            .padding(5)
                        
                      
                        Text(station.title) .font(.custom("arial", size: 24)) .padding(.top,10)
                            .bold()
                       
                NavigationLink(destination: TripView(station: StationsModel(title: station.title, coordinates: station.coordinates))) {
                            Text("See Trips ")
                                .fontWeight(.bold)
                                .frame(width: UIScreen.main.bounds.width -
                                       60, height: 50)
                                .background (Color(hex: "00b36e"))
                                .cornerRadius (20)
                                .foregroundColor(.white)
                        }
                        .padding( .top,10)
                        
                        .cornerRadius(30)
                        
                    }.frame(width: UIScreen.main.bounds.width -
                            25,height: 350)
            
                    .cornerRadius (10)
                .padding(.horizontal)
        }
      Spacer()
            }
        
    
        // Customize your station information view here
        
    }

