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
    @Binding  var driverState: DriverState
    @Binding  var mapState: MapViewState
    var body: some View {
        VStack {
            NavigationView {
                List {
                    ForEach(clients, id: \.id) { client in
                        NavigationLink(
                            destination: RequestAcceptView(client: client, driverState: $driverState, mapState: $mapState),
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
                destination: RequestAcceptView(client: selectedClient ?? ClientModel(id: 0, name: "", location: "", coordinates: Cordinates(lan: -122, lat: 37), imageName: "", description: ""), driverState: $driverState, mapState: $mapState),
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


