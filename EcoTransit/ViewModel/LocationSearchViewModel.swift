//
//  LocationSearchViewModel.swift
//  EcoTransit
//
//  Created by imba on 6/11/2023.
//

import Foundation
import MapKit




class LocationSearchViewModel: NSObject, ObservableObject {
    
    
    @Published var results = [MKLocalSearchCompletion]()
    @Published var selectedLocationCoordinate: CLLocationCoordinate2D?
    @Published var selectedLocationTitle: String?
    @Published var fromStation : StationsModel?
    @Published var toStation : StationsModel?

    private let searchCompleter = MKLocalSearchCompleter()
    var queryFragment: String = ""
    {
        didSet{
            searchCompleter.queryFragment = queryFragment
        }
    }
    
    override init() {
        super.init()
        searchCompleter.delegate = self
        searchCompleter.queryFragment = queryFragment
    }
    
    func selectLocation(_ localSearch: MKLocalSearchCompletion) {
        locationSearch(forLocalSearchCompletion: localSearch) { response, error in
            if let error = error {
                print("DEBUG: Location search failed with error\(error.localizedDescription)")
            }
            guard let item = response?.mapItems.first else { return }
            let coordinate = item.placemark.coordinate
            print("DEBUG: Location coordinates \(coordinate)")
            self.selectedLocationCoordinate = coordinate
        }
        
    }

    func locationSearch( forLocalSearchCompletion localSearch: MKLocalSearchCompletion,
    completion: @escaping MKLocalSearch.CompletionHandler) {
    let searchRequest = MKLocalSearch.Request ()
    searchRequest.naturalLanguageQuery = localSearch.title.appending(localSearch.subtitle)
    let search = MKLocalSearch(request: searchRequest)
    search.start (completionHandler: completion)
        
    }
    func setLocation(location: CLLocationCoordinate2D) {
        self.selectedLocationCoordinate = location
    }
    
    func setTitle(title: String) {
        self.selectedLocationTitle = title
    }
}

extension LocationSearchViewModel: MKLocalSearchCompleterDelegate {
   func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
    self.results = completer.results

}
}
