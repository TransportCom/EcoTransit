//
//  RequestAcceptView.swift
//  EcoTransit
//
//  Created by imba on 15/11/2023.
//

import SwiftUI
import MapKit

struct RequestAcceptView: View {
    let client: ClientModel // Assuming you have a ClientModel to get client details
    @State private var isChatViewPresented = false
    @EnvironmentObject var viewModel: LocationSearchViewModel
    @Binding  var driverState: DriverState
    @Binding  var mapState: MapViewState
    var body: some View {
        VStack {
            Image(systemName: "checkmark.circle.fill")
                .font(.system(size: 100))
                .foregroundColor(.green)
                .padding()

            Text("Request Accepted!")
                .font(.title)
                .foregroundColor(.green)
                .padding()

            Text("Client Name: \(client.name)")
                .font(.body)
                .padding()

            Text("Location: \(client.location)")
                .font(.body)
                .padding()
           Spacer()
            Button("Chat") {
                // Action to start a chat
                isChatViewPresented.toggle()
            }
            .padding()
            .background(Color.green)
            .foregroundColor(.white)
            .cornerRadius(15)
            .sheet(isPresented: $isChatViewPresented) {
                ContentChatView()
            }
    
        }
        .padding()
        .onAppear(perform: {
            driverState = .NotAvailable
            viewModel.setLocation(location: CLLocationCoordinate2D(latitude: client.coordinates.lat, longitude: client.coordinates.lan))
            mapState = .loctionSelected
        })
    }
}
