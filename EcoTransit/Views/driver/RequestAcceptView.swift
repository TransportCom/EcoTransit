//
//  RequestAcceptView.swift
//  EcoTransit
//
//  Created by imba on 15/11/2023.
//

import SwiftUI

struct RequestAcceptView: View {
    let client: ClientModel // Assuming you have a ClientModel to get client details

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

            // Additional details or actions can be added here
        }
        .padding()
    }
}

struct RequestAcceptView_Previews: PreviewProvider {
    static var previews: some View {
        let sampleClient = ClientModel(id: 1, name: "Client Name", location: "Client Location", imageName: "client_profile_image", description: "Client description")
        return RequestAcceptView(client: sampleClient)
    }
}
