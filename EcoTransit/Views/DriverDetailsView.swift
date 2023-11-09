//
//  DriverDetailsView.swift
//  EcoTransit
//
//  Created by imba on 9/11/2023.
//

import SwiftUI

struct DriverDetailsView: View {
    var driverInfo: DriverModel
  
    var body: some View {
        NavigationView {
            ZStack {
                VStack(alignment:.leading,spacing: 20) {
                    Spacer()
                    Image("")
                        .resizable().cornerRadius(32)
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 200).padding(.top,20)
                  
                    HStack {
                        Text(driverInfo.name)
                            .font(.title)
                            .padding(.top, 16)
                        
                        Spacer()
                        
                        Button("Show Map") {
                            // Action to show the map
                        }
                        .foregroundColor(Color.green)
                        .padding(.top, 16)
                    }
                    HStack() {
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                            .foregroundColor(.gray)
                            .padding(.bottom,1)
                        Text(driverInfo.reviews).font(.system(size: 16)).foregroundColor(.gray)
                        Color("355E3B")
                            .frame(width: 70, height: 70)
                            .cornerRadius(15)
                        Spacer()
                        Image(systemName: "star")
                               .resizable()
                               .frame(width: 25, height: 25)
                               .foregroundColor(Color.gray)
                    }
                    
                    Text(driverInfo.location)
                        .foregroundColor(.gray)
                        .padding(.bottom, 10)
                   
                    Text(driverInfo.description)
                        Spacer()

                    HStack{
                        Button("Chat") {
                            // Action to start a chat
                        }
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(15)
                        
                        Spacer()
                        
                        Color("355E3B")
                            .frame(width: 70, height: 70)
                            .cornerRadius(15)
                        
                        Image(systemName: "heart")
                               .resizable()
                               .frame(width: 25, height: 25)
                               .foregroundColor(Color.gray)
                    }
                }
                .padding(.horizontal, 15)
            }
            .background(Color.white)
            .cornerRadius(16)
            .padding(.horizontal, 16)
            .padding(.top, -10)
            .navigationBarTitle("driver info", displayMode: .inline)
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: Button(action: {
             
            }) {
                Image(systemName: "arrow.left")
                    .foregroundColor(Color.green)
            })
        }
    }
}

struct DriverDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DriverDetailsView(driverInfo: DriverModel(
            id: 1,
            name: "Driver Driver",
            location: "Tunis, Tunisie",
            imageName: "driver_image",
            description: "blablalblablablablalblablablablalblablablablalblablablablalblablablablalblablablablalblablablablalblablablablalblablablablalblablablablalblablablablalblablablablalblablablablalblablablablalblabla",
            reviews: "123",
            rideType: .taxi
        ))
    }
}
