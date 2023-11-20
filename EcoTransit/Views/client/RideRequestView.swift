//
//  RideRequestView.swift
//  EcoTransit
//
//  Created by imba on 8/11/2023.
//

import SwiftUI


struct RideRequestView: View {
    @State private var selectedRideType: RideType = .taxi
    @State private var offset: CGFloat = 0
    @State private var isSwipedDown: Bool = false
    @State private var isConfirmationPresented: Bool = false
    @StateObject var stationViewModel : StationViewModel
    let selectedCordinates : Cordinates
    @Binding var mapState: MapViewState


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
                    HStack {
                        Text("Current location")
                            .font(.system(size: 16))
                            .foregroundColor(.gray)
                        Spacer()
                        Text("1:30 PM")
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(.gray)
                    }
                    .padding(10)
                    
                    HStack {
                        Text("De Anza College")
                            .font(.system(size: 16, weight: .bold))
                            .foregroundColor(.green)
                        Spacer()
                        Text("1:45 PM")
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(.gray)
                    }
                    .padding(10)
                }
                .padding(.leading, 10)
                
            }
            
            
            Divider()
                .padding(.vertical, 18)
            
            Text("MEANS OF TRANSPORT")
                .font(.subheadline)
                .fontWeight(.semibold)
                .padding()
                .foregroundColor(.black)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            ScrollView(.horizontal) {
                HStack(spacing: 12) {
                    ForEach(RideType.allCases) { type in
                        VStack(alignment: .leading) {
                            Image(type.imageName)
                                .resizable()
                                .scaledToFit()
                            VStack(spacing: 5) {
                                Text(type.description)
                                    .font(.system(size: 14, weight: .semibold))
                                    .foregroundColor(.black)
                            }
                            .padding(8)
                        }
                        .frame(width: 120, height: 140)
                        .background(Color(type == selectedRideType ? .systemGreen : .systemGroupedBackground))
                        .cornerRadius(10)
                        .onTapGesture {
                            withAnimation(.spring()) {
                                selectedRideType = type
                                stationViewModel.fetchStations()
                                
                            }
                        }
                    }
                }
            }
            .padding(.horizontal)
            
           
            Button {
                mapState = .vehiculeSelected
       
                print(mapState)
        
                    } label: {
                    Text("Confirm")
                                   .fontWeight(.bold)
                                   .frame(width: UIScreen.main.bounds.width - 32, height: 50)
                                   .background(.green)
                                   .cornerRadius(10)
                                   .foregroundColor(.white)
                           }
                           .padding(.bottom, 5)
                           .background(Color.white.opacity(0.8))
                           .cornerRadius(20)
                           .edgesIgnoringSafeArea(.all)
                           
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
    
    /*struct RideRequestView_Previews: PreviewProvider {
        @StateObject var stationViewModel : StationViewModel
        static var previews: some View {
            RideRequestView(stationViewModel: StationViewModel())
        }
    }*/
}
