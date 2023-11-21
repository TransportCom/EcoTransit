//
//  MapViewActionButton.swift
//  EcoTransit
//
//  Created by imba on 5/11/2023.
//

import SwiftUI
import MapKit
struct MapViewDriverActionButton: View {
    @Binding var driverState: DriverState
    @Binding var mapState: MapViewState
    @EnvironmentObject var viewModel: LocationSearchViewModel
    @State var showClientList: Bool = false
    
    var body: some View {
        Button {
            withAnimation(.spring()) {
                actionForState(state: driverState)
            }
        } label: {
            Image(systemName: imageNameForState(driverState))
                .font(.title2)
                .foregroundColor(.black)
                .padding()
                .background(backgroundForState(driverState))
                .clipShape(Circle())
                .shadow(color: .green, radius: 3)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    func actionForState( state: DriverState) {
        switch state {
        case .Available:
            print("Driver is available")
            break
        case .NotAvailable:
            print("driver is not available")
            driverState = .Available
            mapState = .noInput
            viewModel.setLocation(location: CLLocationCoordinate2D(latitude: 0, longitude: 0))
        }
    }
    
    func imageNameForState(_ state: DriverState) -> String {
        switch state {
        case .Available:
            return "checkmark"
            
        case .NotAvailable:
            return "checkmark"
        }
    }
    
    func backgroundForState(_ state: DriverState) -> Color {
        switch state {
        case .Available:
            return .white
            
        case .NotAvailable:
            return .red
        }
    }
}

struct MapViewDriverActionButton_Previews: PreviewProvider {
    static var previews: some View {
        MapViewDriverActionButton(driverState: .constant(.Available), mapState:.constant(.noInput) )
            .environmentObject(LocationSearchViewModel())
    }
}
