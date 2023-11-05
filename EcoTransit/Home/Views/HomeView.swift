//
//  HomeView.swift
//  EcoTransit
//
//  Created by imba on 5/11/2023.
import SwiftUI
struct HomeView: View {
    @State private var showLocationSearchView = false
    var body: some View {
        ZStack (alignment: .top) {
            MapViewRepresentable()
                .ignoresSafeArea()
            if showLocationSearchView{
                LocationSearchView()
            }else {
                LocationSearchActivationView()
                    .padding(.top, 72)
                    .onTapGesture {
                        withAnimation(.spring())
                        {
                            showLocationSearchView.toggle()
                        }
                        }
                                      
                    }
            }
            MapViewActionButton(showLocationSearchView:
                                    $showLocationSearchView)
                .padding(.top, 4)
                .padding(.leading)
        }
        
    }


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
    HomeView()
    }
}

