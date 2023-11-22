//
//  Swipe2View.swift
//  EcoTransit
//
//  Created by imba on 17/11/2023.
//

import SwiftUI

struct Swipe2View: View {
    @State private var currentPage: CGFloat = 3.0 / 3.0
    @State private var navigateToLocation = false
    var body: some View {
        NavigationStack{
            ZStack {
                Color(.white)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Spacer().frame(height: 150)
                    
                    Image("swipedriver")
                        .resizable()
                   
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 250, height: 200)
                        .alignmentGuide(.top) { Dimensions in Dimensions[.top] }
                    
                    
                    Spacer().frame(height: 50)
                    Text("    Accept the request")
                        .font(.system(size: 30, weight: .medium, design: .default))
                        .frame(width: 200, height: 100)
                        .foregroundColor(.green)
                     
                    
                    Text("Go for the client you choose ")
                        .font(.system(size: 22, weight: .medium, design: .default))
                    
                    Spacer()
                    
                    VStack {
                        NavigationLink(destination: DriverHomeView(), isActive: $navigateToLocation) {
                            
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
    
    
    
    
    
    
    
    struct Swipe2View_Previews: PreviewProvider {
        static var previews: some View {
        Swipe2View()
        }
    }
    
}
