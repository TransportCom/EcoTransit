//
//  RequestSentView.swift
//  EcoTransit
//
//  Created by imba on 21/11/2023.
//


import SwiftUI
import MapKit

struct RequestSentView: View {
    let driver: DriverModel
    @State private var isChatViewPresented = false
    @EnvironmentObject var viewModel: LocationSearchViewModel
 
    var body: some View {
        VStack {
            Image(systemName: "checkmark.circle.fill")
                .font(.system(size: 100))
                .foregroundColor(.green)
                .padding()

            Text("Request Sent")
                .font(.title)
                .foregroundColor(.green)
                .padding()

            Text("Driver Name: \(driver.name)")
                .font(.body)
                .padding()

            Text("Location: \(driver.location)")
                .font(.body)
                .padding()
           Spacer()
            
    
        }
        .padding()
      
    }
}
