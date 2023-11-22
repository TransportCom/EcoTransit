//
//  Home.swift
//  ecotransit
//
//  Created by Mohamed Achi on 15/11/2023.
//


import SwiftUI

struct Home: View {
    
    // Shared Data...
    var animation: Namespace.ID

    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false) {
            
            VStack(spacing: 15){
                
                // Search Bar...
                
                ZStack{
                    
                }
                .frame(width: getRect().width / 1.6)
                .padding(.horizontal,25)
                .contentShape(Rectangle())
                
                
                Text("choose your activity")
                    .font(.custom(customFont, size: 28).bold())
                    .frame(maxWidth: .infinity,alignment: .leading)
                    .padding(.top)
                    .padding(.horizontal,25)
                
                // Products Tab....
                
                ScrollView(.horizontal, showsIndicators: false) {
                    
                    HStack(spacing: 18){
                    
                    }
                    .padding(.horizontal,25)
                }
                .padding(.top,28)
                
                // Products Page...
                ScrollView(.horizontal, showsIndicators: false) {
                    
                    HStack(spacing: 25){
                        
                     
                    }
                    .padding(.horizontal,25)
                    .padding(.bottom)
                    .padding(.top,80)
                }
                .padding(.top,30)
                
                // See More Button...
                // This button will show all products on the current product type..
                // since here were showing only 4...

            }
            .padding(.vertical)
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        .background(Color("HomeBG"))
        // Updating data whenever tab changes...
       
        // Preview Issue...
      
        // Displaying Search View....
        .overlay(
        
            ZStack{
                
              
            }
        )
    }
    
    // Since we're adding matched geometry effect...
    // avoiding code replication...
    @ViewBuilder
    func SearchBar()->some View{
        
        HStack(spacing: 15){
            Image(systemName: "magnifyingglass")
                .font(.title2)
                .foregroundColor(.gray)
            
            // Since we need a separate view for search bar....
            TextField("Search", text: .constant(""))
                .disabled(true)
        }
        .padding(.vertical,12)
        .padding(.horizontal)
        .background(
        
            Capsule()
                .strokeBorder(Color.gray,lineWidth: 0.8)
        )
    }
}

