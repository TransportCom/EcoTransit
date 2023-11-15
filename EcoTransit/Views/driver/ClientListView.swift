//
//  ClientListView.swift
//  EcoTransit
//
//  Created by imba on 14/11/2023.
//

import SwiftUI
struct ClientListView: View {
    @State  var clients: [ClientModel]
    @State private var isRequestAccepted = false
    @State private var selectedClient: ClientModel?

    var body: some View {
        VStack {
            NavigationView {
                List {
                    ForEach(clients, id: \.id) { client in
                        NavigationLink(
                            destination: RequestAcceptView(client: client),
                            label: {
                                ClientResultCell(client: client)
                                    .contextMenu {
                                        Button(action: {
                                            acceptRequest(client: client)
                                        }) {
                                            Label("Accept", systemImage: "checkmark.circle.fill")
                                        }
                                       
                                    }
                            }
                        )
                    }
                    .onDelete { indexSet in
                        // Handle delete action (Decline)
                        clients.remove(atOffsets: indexSet)
                    }
                    .onMove { indices, newOffset in
                        // Handle move action (Accept)
                        clients.move(fromOffsets: indices, toOffset: newOffset)
                    }
                }
                .navigationBarTitle("Requests", displayMode: .inline)
            }
            
            NavigationLink(
                destination: RequestAcceptView(client: selectedClient ?? ClientModel(id: 0, name: "", location: "", imageName: "", description: "")),
                isActive: $isRequestAccepted,
                label: { EmptyView() }
            )
            .isDetailLink(false) // This prevents automatic navigation
            
            Text("accept by clicking on the offer")
                .background(Color.clear)
            Text("decline by swiping")
                .background(Color.clear)
        }
    }
    
    private func acceptRequest(client: ClientModel) {
        selectedClient = client
        isRequestAccepted = true
    }
    
    private func declineRequest(client: ClientModel) {
        // Handle Decline action
    }
}

struct ClientListView_Previews: PreviewProvider {
    static var previews: some View {
        ClientListView(clients: [
            ClientModel(id: 1, name: "client1", location: "location 1, testestets", imageName: "client_profile_image", description: "Client description"),
            ClientModel(id: 2, name: "client2", location: "location 1, testestets", imageName: "client_profile_image", description: "Client description"),
            ClientModel(id: 3, name: "clien21", location: "location 1, testestets", imageName: "client_profile_image", description: "Client description"),
            ClientModel(id: 4, name: "client4", location: "location 1, testestets", imageName: "client_profile_image", description: "Client description")
        ])
    }
}

