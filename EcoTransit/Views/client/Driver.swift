//
//  Driver.swift
//  EcoTransit
//
//  Created by imba on 5/11/2023.
//

import SwiftUI

struct Driver: View {
    @State private var currentPage: CGFloat = 3.0 / 3.0
    @State private var navigateToLocation = false
    var body: some View {
        ZStack {
            Color(.white)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer().frame(height: 180)
                
                Image("Driver")
                    .resizable()
               
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 250, height: 200)
                    .alignmentGuide(.top) { Dimensions in Dimensions[.top] }
                
                Spacer()
                Text("Confirm your ride")
                    .font(.system(size: 30, weight: .medium, design: .default))
                    .frame(width: 200, height: 100)
                    .foregroundColor(.green)
                
                Text("Huge drivers network helps you find comfortable,safe and cheap rides ")
                    .font(.system(size: 22, weight: .medium, design: .default))
                
                Spacer()
                
             
                
                
            }
            
           
        }
        
    }
    
    
    
    
   
    
    
    
    struct Driver_Previews: PreviewProvider {
        static var previews: some View {
            Driver()
        }
    }
    
}
