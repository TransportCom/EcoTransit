//
//  Location.swift
//  EcoTransit
//
//  Created by imba on 5/11/2023.
//
import SwiftUI

struct LocationView: View {
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
                Text("Accept the ride request")
                    .font(.system(size: 30, weight: .medium, design: .default))
                    .frame(width: 200, height: 100)
                    .foregroundColor(.green)
                
                Text("find the customer and contact them ")
                    .font(.system(size: 22, weight: .medium, design: .default))
                
                Spacer()
                
                
                
                
            }
            
         
        }
        .onAppear {
            // Set progressBarAnimation to true when the view appears to animate the progress bar
            withAnimation(Animation.linear(duration: 0.5)) {
                currentPage = 2.0 / 3.0
            }
        }
    }
    
    
    
    struct LocationView_Previews: PreviewProvider {
        static var previews: some View {
            LocationView()
        }
    }
}
