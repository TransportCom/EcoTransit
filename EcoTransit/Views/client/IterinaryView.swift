//
//  iterinaryView.swift
//  EcoTransit
//
//  Created by imba on 20/11/2023.
//


import SwiftUI


struct IterinaryView: View {
    @State var selectedRideType: RideType
    @State private var offset: CGFloat = 0
    @State private var isSwipedDown: Bool = false
    @State private var isConfirmationPresented: Bool = false
    @State var showDriverList: Bool = false
    @State var isTaxi : Bool = false
    @EnvironmentObject var locationViewModel: LocationSearchViewModel
    @StateObject var stationViewModel : StationViewModel
    
    var body: some View {
        
        VStack {
            
            Capsule()
                .foregroundColor(Color(.systemGreen))
                .frame(width: 48, height: 6)
                
            
            
            HStack {
                VStack {
                    HStack {
                        VStack {
                            Circle()
                                .fill(Color(.systemGray3))
                                .frame(width: 8, height: 8)
                            Rectangle()
                                .fill(Color(.systemGray3))
                                .frame(width: 1, height: 32)
                            Rectangle()
                                .fill(.black)
                                .frame(width: 8, height: 8)
                        }
                    }
                    .padding(10)
                }
                
                VStack(alignment: .leading, spacing: 24) {
                    
                    Text(selectedRideType.description) 
                    HStack {
                        Text(locationViewModel.fromStation?.title ?? "Current Location")
                            .font(.system(size: 16))
                            .foregroundColor(.gray)
                        Spacer()
                        Text("From Station")
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(.gray)
                    }
                    .padding(10)
                    
                    HStack {
                        Text( locationViewModel.toStation?.title ?? locationViewModel.selectedLocationTitle	 ?? "Destination"  )
                            .font(.system(size: 16, weight: .bold))
                            .foregroundColor(.green)
                        Spacer()
                        Text("To Station")
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(.gray)
                       }
                    }
                    .padding(10)
                    .sheet(isPresented: $isTaxi) {
                       DriverListView(drivers: [
                           DriverModel(id: 1, name: "imen test", location: "location 1, testestets", imageName: "driver_profile_image", description: "Driver description", reviews: "5", rideType: .taxi)
                           // Add more drivers as needed
                       ])
                       .transition(.move(edge: .bottom))
                       .padding(.bottom ,15)
                       .animation(.spring())
                }
                .padding(.leading, 10)
                /*.onAppear(perform: {
                    DispatchQueue.main.asyncAfter(deadline: .now()+3, execute: {
                    })
                })*/
                
            }
           
            Divider()
            
                
            
        }
        .background(Color.white.opacity(0.8))
        .offset(y: isSwipedDown ? UIScreen.main.bounds.height : offset)
            .animation(.spring())
        
        .gesture(
            DragGesture()
                .onChanged { value in
                    if value.translation.height > 0 {
                        offset = value.translation.height
                    }
                }
                .onEnded { value in
                    withAnimation(.spring()) {
                        if offset > 100 {
                            isSwipedDown = true
                        } else {
                            offset = 0
                        }
                    }
                }
        )
       
    }
}
