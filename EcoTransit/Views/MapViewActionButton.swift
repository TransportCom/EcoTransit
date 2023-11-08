//
//  MapViewActionButton.swift
//  EcoTransit
//
//  Created by imba on 5/11/2023.
//

import SwiftUI

struct MapViewActionButton: View {
    @Binding var mapState: MapViewState
    @EnvironmentObject var viewModel: LocationSearchViewModel
    var body: some View {
        Button {
            withAnimation(.spring()) {
            actionForState(mapState)
        }
           
        } label: {
            Image (systemName: imageNameForState(mapState))
                .font (.title2)
                .foregroundColor(.black)
                .padding()
                .background (.white)
                .clipShape (Circle ())
                .shadow (color: .green, radius: 3)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        }
    func actionForState(_ state: MapViewState)
    {
        switch state {
        case.noInput:
            print("NO INPUT")
        case.searchingForLocation:
            mapState = .noInput
        case.loctionSelected:
            
                print("clear mapview")
                mapState = .noInput
                viewModel.selectedLocationCoordinate = nil
            
        }
        }
    
    func imageNameForState(_ state: MapViewState) ->String
    {
        switch state {
        case.noInput:
           return "line.3.horizontal"
        case.searchingForLocation , .loctionSelected:
            return "arrow.left"
        }
        }

    
    }



struct MapViewActionButton_Previews: PreviewProvider {
    static var previews: some View {
        MapViewActionButton(mapState: .constant(.noInput))
    }
}
