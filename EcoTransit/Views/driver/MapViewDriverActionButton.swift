//
//  MapViewActionButton.swift
//  EcoTransit
//
//  Created by imba on 5/11/2023.
//

import SwiftUI

struct MapViewDriverActionButton: View {
    @Binding var mapState: DriverState
    @EnvironmentObject var viewModel: LocationSearchViewModel
    @State var showClientList: Bool = false
    var body: some View {
        Button {
            withAnimation(.spring()) {
                actionForState(DriverState.Available)
           
        }
           
        } label: {
            Image (systemName: imageNameForState(DriverState.Available))
                .font (.title2)
                .foregroundColor(.black)
                .padding()
                .background (.white)
                .clipShape (Circle ())
                .shadow (color: .green, radius: 3)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        }
    func actionForState(_ state: DriverState)
    {
        switch state {
        case.Available:
            print("Driver is available")
       
        case.NotAvailable:
            
                print("driver is not available")
                mapState = .NotAvailable
               // viewModel.selectedLocationCoordinate = nil
            
        }
        }
    
    func imageNameForState(_ state: DriverState) ->String
    {
        switch state {
        case.Available:
           return "checkmark"
            
        case.NotAvailable:
            return "arrow.left"
        }
        }

    
    }



struct MapViewDriverActionButton_Previews: PreviewProvider {
    static var previews: some View {
        MapViewDriverActionButton(mapState: .constant(.Available))
    }
}
