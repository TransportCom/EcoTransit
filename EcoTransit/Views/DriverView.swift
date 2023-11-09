//
//  Driver.swift
//  EcoTransit
//
//  Created by imba on 5/11/2023.
//

import SwiftUI

struct DriverView: View {
    @State private var currentPage: CGFloat = 3.0 / 3.0
    @State private var navigateToLocation = false
    var body: some View {
        ZStack {
            Color(.white)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer().frame(height: 50)
                
                Image("taxi")
                    .resizable()
                    .clipShape(Circle())
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 300, height: 250)
                    .alignmentGuide(.top) { Dimensions in Dimensions[.top] }
                
                Spacer()
                Text("Confirm your ride")
                    .font(.system(size: 30, weight: .medium, design: .default))
                    .frame(width: 200, height: 100)
                    .foregroundColor(.green)
                
                Text("be a part of the driver community ")
                    .font(.system(size: 22, weight: .medium, design: .default))
                
                Spacer()
                
             
                
                
            }
            
           
        }
        
    }
    
    
    
    
   
    
    
    
    struct DriverView_Previews: PreviewProvider {
        static var previews: some View {
            DriverView()
        }
    }
    
}
