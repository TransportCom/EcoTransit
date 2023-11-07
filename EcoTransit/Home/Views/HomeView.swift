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
         
            if showLocationSearchView{
               
                LocationSearchView(showLocationSearchView:$showLocationSearchView)
                
                MapViewActionButton(showLocationSearchView:
                                        $showLocationSearchView)
                    .padding(.top, 5)
                    .padding(.leading)
                
            
            }else {
                HStack {
                    MapViewActionButton(showLocationSearchView:
                                            $showLocationSearchView)
                    .padding(.top, 70)
                    .padding(.leading)
                    
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
            }
          .navigationBarBackButtonHidden(true)
        
        }
        
    }

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
    HomeView()
    }
}

