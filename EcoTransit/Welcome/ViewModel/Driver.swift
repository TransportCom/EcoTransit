//
//  Driver.swift
//  EcoTransit
//
//  Created by imba on 5/11/2023.
//
import SwiftUI
struct Driver: View {
    @State private var currentPage: CGFloat = 1.0 / 3.0
    
    var body: some View {
        NavigationView{
        ZStack {
            Color(.white)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Image("Driver")
                    .resizable()
                    .clipShape(Circle())
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 200, height: 200)
                    .alignmentGuide(.top) { Dimensions in Dimensions[.top] }
                
                Spacer()
                NavigationLink(destination: TrackYourRide()) {
                    Text("Confirm your driver")
                        .font(.system(size: 32, weight: .medium, design: .default))
                    .frame(width: 200, height: 100)}
            Text("Huge drivers network helps you find comfortable,safe and cheap rode ")
                .font(.system(size: 22, weight: .medium, design: .default))
            
            Spacer()
            
            LinearProgressBar(progress: currentPage)
                .frame(height: 10)
                .edgesIgnoringSafeArea(.bottom)
        }
        .onAppear {
            // Set progressBarAnimation to true when the view appears to animate the progress bar
            withAnimation(Animation.linear(duration: 0.5)) {
                currentPage = 2.0 / 3.0
            }
        }
    }
    }
    }
    
    struct LinearProgressBar: View {
        var progress: CGFloat
        
        var body: some View {
            GeometryReader { geometry in
                HStack(spacing: 0) {
                    Rectangle()
                        .foregroundColor(Color.blue)
                        .frame(width: geometry.size.width * self.progress, height: geometry.size.height)
                        .cornerRadius(10)
                    Rectangle()
                        .foregroundColor(Color.gray.opacity(0.3))
                        .frame(width: geometry.size.width * (1 - self.progress), height: geometry.size.height)
                        .cornerRadius(10)
                    .frame(height: 700)            }
            }
            .frame(width: 200  , alignment: .leading)
        }
    }
    
    
    
    struct Driver_Previews: PreviewProvider {
        static var previews: some View {
            Driver()
        }
    }
    
}
