//
//  Swipe1View.swift
//  EcoTransit
//
//  Created by imba on 17/11/2023.
//
//
//  Driver.swift
//  EcoTransit
//
//  Created by imba on 5/11/2023.
//

import SwiftUI

struct Swipe1View: View {
    @State private var currentPage: CGFloat = 3.0 / 3.0
    @State private var navigateToLocation = false
    var body: some View {
        ZStack {
            Color(.white)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer().frame(height: 160)
                Image("map")
                    .resizable()
                    .clipShape(Circle())
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 300, height: 250)
                    .alignmentGuide(.top) { Dimensions in Dimensions[.top] }
               
                Spacer()
                Text("Get requests from   the closest clients")
                    .font(.system(size: 30, weight: .medium, design: .default))
                    .frame(width: 300, height: 100)
                    .foregroundColor(.green)
                
                Text("Huge clients network helps you find comfortable, safe and cheap rides ")
                    .font(.system(size: 22, weight: .medium, design: .default))
                
                Spacer()
                
             
                
                
            }
            
           
        }
        
    }
    
    
    
    
   
    
    
    
    struct Swipe1View_Previews: PreviewProvider {
        static var previews: some View {
            Swipe1View()
        }
    }
    
}
