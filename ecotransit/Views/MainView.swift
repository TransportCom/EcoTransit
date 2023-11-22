//
//  MainView.swift
//  ecotransit
//
//  Created by Mohamed Achi on 15/11/2023.
//

import SwiftUI

struct MainView: View {
    // Current Tab...
    @State var currentTab: Tab = .Home
    
    // Animation Namespace...
    @Namespace var animation
    
    // Hiding Tab Bar...
    init(){
        UITabBar.appearance().isHidden = true
    }
    var body: some View {
        
        VStack(spacing: 0){
            
            // Tab View...
            TabView(selection: $currentTab) {
                
                Home(animation: animation)
                    .tag(Tab.Home)
                
                Liked()
                    .tag(Tab.Liked)
                ProfileView()
                    .tag(Tab.Profile)
                
            }
            
            // Custom Tab Bar...
            HStack(spacing: 0){
                ForEach(Tab.allCases,id: \.self){tab in
                    
                    Button {
                        // updating tab...
                        currentTab = tab
                    } label: {
                        
                        Image(tab.rawValue)
                            .resizable()
                            .renderingMode(.template)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 22, height: 22)
                        // Applying little shadow at bg...
                            .background(
                                
                                Color(.green)
                                    .opacity(0.1)
                                    .cornerRadius(5)
                                // blurring...
                                    .blur(radius: 5)
                                // Making little big...
                                    .padding(-7)
                                    .opacity(currentTab == tab ? 1 : 0)
                                
                            )
                            .frame(maxWidth: .infinity)
                            .foregroundColor(currentTab == tab ? Color(.red) : Color.black.opacity(0.3))
                    }
                }
            }
            .padding([.horizontal,.top])
            .padding(.bottom,10)
        }
        .background(Color("HomeBG").ignoresSafeArea())
        .overlay(
            
            ZStack{
                // Detail Page...
                
            }
        )
    }
}
    
// Making Case Iteratable...
// Tab Cases...
enum Tab: String,CaseIterable{
    
    // Raw Value must be image Name in asset..
    
    case Liked = "Liked"
    case Home = "Home"
    case Profile = "profilo"
}

#Preview {
    MainView()
}
