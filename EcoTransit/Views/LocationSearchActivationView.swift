//
//  LocationSearchActivationView.swift
//  EcoTransit
//
//  Created by imba on 5/11/2023.
//

import SwiftUI

struct LocationSearchActivationView: View {
    @State private var showLocationSearchView = false
var body: some View {
    HStack {
      

        HStack {
        
        Rectangle ()
        .fill(Color.black)
        .frame (width: 8, height: 8)
        .padding (.horizontal)
    Text ("Where to?")
        .foregroundColor(Color(.darkGray))
    Spacer ()
        }
        .frame(width: UIScreen.main.bounds.width
               / 1.3, height: 50)
   
    .background(
    Rectangle()
        .fill(Color.white)
    .shadow(color: .green, radius: 5))
    }.padding(.trailing, 33)
    

}
    
}

struct LocationSearchActivationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationSearchActivationView()
    }
}

