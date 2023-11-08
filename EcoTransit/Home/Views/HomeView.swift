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
               
                VStack {
                    
                    MapViewActionButton(showLocationSearchView: $showLocationSearchView)
                        .padding(.top, 50)
                        .padding(.leading)

                   
                        LocationSearchView(showLocationSearchView: $showLocationSearchView)
                   
                    
                }

            
            }else {
                HStack {
                    MapViewActionButton(showLocationSearchView:
                                            $showLocationSearchView)
                    .padding(.top, 50)
                    .padding(.leading)
                    
                    LocationSearchActivationView()
                        .padding(.top, 52)
                        .onTapGesture {
                            withAnimation(.spring())
                            {
                                showLocationSearchView.toggle()
                            }
                        }
                }
                                      
                    }
            } .edgesIgnoringSafeArea(.all)
          .navigationBarBackButtonHidden(true)
        
        }
        
    }

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
    HomeView()
    }
}

