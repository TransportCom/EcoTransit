//
//  TrackYourRide.swift
//  EcoTransit
//
//  Created by imba on 5/11/2023.
//

import SwiftUI

struct TrackYourRide: View {
    @State private var currentPage: CGFloat = 3.0 / 3.0
    @State private var navigateToLocation = false
    var body: some View {
        NavigationStack{
            ZStack {
                Color(.white)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Spacer().frame(height: 150)
                    
                    Image("map")
                        .resizable()
                        .clipShape(Circle())
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 300, height: 250)
                        .alignmentGuide(.top) { Dimensions in Dimensions[.top] }
                    
                    Spacer()
                    Text("Track your ride")
                        .font(.system(size: 30, weight: .medium, design: .default))
                        .frame(width: 200, height: 100)
                        .foregroundColor(.green)
                    
                    Text("Huge drivers network helps you find comfortable,safe and cheap rode ")
                        .font(.system(size: 22, weight: .medium, design: .default))
                    
                    Spacer()
                    
                    VStack {
                        NavigationLink(destination: HomeView(stationViewModel: StationViewModel()), isActive: $navigateToLocation) {
                            
                        }
                        
                        .hidden()
                        Spacer()
                        Button(action: {
                            navigateToLocation = true
                            
                        })
                        {
                            Text("  GET STARTED!    ")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding()
                                .background(Color.green)
                                .cornerRadius(30)
                                .frame(width: 300, height: 150)
                        }
                        
                    }
                    
                }
                
              
            }
 
        }
    }
    
    
    
    
    
    
    
    struct TrackYourRide_Previews: PreviewProvider {
        static var previews: some View {
            TrackYourRide()
        }
    }
    
}
