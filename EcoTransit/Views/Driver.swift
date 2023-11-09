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
                Spacer().frame(height: 50)
                
                Image("Driver")
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
                
                Text("Huge drivers network helps you find comfortable,safe and cheap rode ")
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
