///
//  ClientResultCell.swift
//  EcoTransit
//
//  Created by imba on 12/11/2023.
//

import SwiftUI

struct ClientResultCell: View {
    let client: ClientModel
    @State private var isChatViewPresented = false
    @State private var isOfferAcceptedPresented = false
    var body: some View {
        HStack {
            Image(client.imageName)
                .resizable()
                .frame(width: 40, height: 40)
                .clipShape(Circle())
            
            VStack(alignment: .leading, spacing: 4) {
                Text(client.name)
                    .font(.body)
                Text(client.location)
                    .font(.system(size: 15))
                    .foregroundColor(.gray)
                Divider()
                
              
            }
        }
        .padding(.leading, 8)
        .padding(.vertical, 8)
        .background(Color.green.opacity(0.1))
    }
}

struct ClientResultCell_Previews: PreviewProvider {
    static var previews: some View {
        ClientResultCell(client: ClientModel(
            id: 1,
            name: "imen test",
            location: "location 1, testestets",
            imageName: "client_profile_image",
            description: "Client description"
        ))
    }
}

