//
//  ClientHomeView.swift
//  EcoTransit
//
//  Created by imba on 13/11/2023.
//

import SwiftUI
struct DriverHomeView: View {
    @State private var showLocationSearchView = false
    @State private var driverState = DriverState.Available
    @State private var mapState = MapViewState.noInput
    @State private var isOpen = false
    @State private var isClientListViewPresented = false
    @State var showClientList: Bool = false
    var body: some View {
        
        
        
        
            ZStack{
                MapViewRepDriver(mapState : $mapState)
                    .ignoresSafeArea()
                
                
                VStack{

                    MapViewDriverActionButton(driverState: $driverState,mapState: $mapState)
                       
                    
                        
                    Spacer().frame(height: 630)
                    Button {
                        showClientList.toggle()
                     
                    }label: {
                        ZStack(alignment:.bottom ){
                            Text("GO")
                                .foregroundColor(Color.white)
                            
                        }.frame(width:60, height: 60,alignment: .center)
                            .overlay( RoundedRectangle(cornerRadius: 30)
                                .stroke(Color.white, lineWidth: 1.5))
                        
                            .cornerRadius(60)
                    } .frame(width: 70,height: 70, alignment: .center)
                        .background(Color.green)
                        .cornerRadius(35)
                    
                        .sheet(isPresented: $showClientList) {
                            ClientListView(clients: [
                                ClientModel(id: 1, name: "client1", location: "location 1, testestets", coordinates: Cordinates(lan: -122.1, lat: 37.1), imageName: "client_profile_image", description: "Client description"),
                                ClientModel(id: 1, name: "client1", location: "location 1, testestets", coordinates: Cordinates(lan: -122.2, lat: 37.2), imageName: "client_profile_image", description: "Client description"),
                                ClientModel(id: 1, name: "client1", location: "location 1, testestets", coordinates: Cordinates(lan: -122.3, lat: 37.3), imageName: "client_profile_image", description: "Client description"),
                                ClientModel(id: 1, name: "client1", location: "location 1, testestets", coordinates: Cordinates(lan: -122.4, lat: 37.4), imageName: "client_profile_image", description: "Client description")
                            ], driverState: $driverState, mapState: $mapState )
                        }
                    
                    /* if mapState == .NotAvailable
                    {
                        
                        RideRequestView(stationViewModel: StationViewModel())
                            .transition(.move(edge: .bottom))
                            .padding(.bottom ,10)
                        
                    }*/
                    
                }
                
        }.navigationBarBackButtonHidden(true)
            .ignoresSafeArea()
        
        
    }
            
        }
    

                     


struct DriverHomeView_Previews: PreviewProvider {
    static var previews: some View {
    DriverHomeView()
    }
}


