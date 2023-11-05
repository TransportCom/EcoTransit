//
//  MapViewActionButton.swift
//  EcoTransit
//
//  Created by imba on 5/11/2023.
//

import SwiftUI

struct MapViewActionButton: View {
    @Binding var showLocationSearchView: Bool
    var body: some View {
        Button{
            showLocationSearchView.toggle()
        } label: {
            
            Image (systemName: "line.3.horizontal")
                .font (.title2)
                .foregroundColor(.black)
                .padding()
                .background (.white)
                .clipShape (Circle ())
                .shadow (color: .black, radius: 6)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        }
    }


struct MapViewActionButton_Previews: PreviewProvider {
    static var previews: some View {
        MapViewActionButton(showLocationSearchView: .constant(true))
    }
}
