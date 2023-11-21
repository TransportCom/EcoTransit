//
//  StationViewModel.swift
//  EcoStation-Swift
//
//  Created by Torkhani fara on 13/11/2023.
//

import Foundation
import SwiftUI

class StationViewModel: ObservableObject {
    
    @Published var stations: [StationsModel] = []
    
    @Published var isLoading = true
    
    @Published var message: String = ""
    
    @Published var fromStation = StationsModel(title:"INITIAL",coordinates: Cordinates(lan: 0, lat: 0))
    
    @Published var toStation = StationsModel(title:"INITIAL",coordinates: Cordinates(lan: 0, lat: 0))

    
    
    func fetchStations() {
        Stationservice().fetchStations(){ result in
            switch result {
                
            case.success(let data):
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
                    if data?.statusCode == 200 {
                        self.isLoading = false
                        self.stations = data?.stations ?? []
                    }
                    self.message = data?.message ?? ""
                }
                
            case.failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func fetchIterinary(id: String, fromLocation: Cordinates, toLocation: Cordinates) {
        Stationservice().fetchIterinary(id:id, fromLocation:fromLocation, toLocation:toLocation ){ result in
            switch result {
                
            case.success(let data):
                print("DATA: \(data)")
                DispatchQueue.main.asyncAfter(deadline: .now() + 0){
                    self.isLoading = false
                    self.fromStation = data?.fromStation ?? StationsModel(title: "noResponse", coordinates: Cordinates(lan: 0, lat: 0))
                    self.toStation = data?.toStation ?? StationsModel(title: "noResponse", coordinates: Cordinates(lan: 0, lat: 0))
                    print("FROM###### \(self.fromStation)")
                    print("TO###### \(self.toStation)")
                    self.stations = [self.fromStation, self.toStation]
                }
                
            case.failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    
}
