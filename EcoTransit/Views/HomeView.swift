//
//  HomeView.swift
//  EcoTransit
//
//  Created by imba on 5/11/2023.
import SwiftUI
struct HomeView: View {
    @State private var showLocationSearchView = false
    @State private var mapState = MapViewState.noInput
 
    
    var body: some View {
       
        ZStack (alignment: .bottom){
            ZStack (alignment: .top) {
              MapViewRepresentable(mapState: $mapState)
                    .ignoresSafeArea()
               
                    
                if mapState == .searchingForLocation
                {
                 
                            LocationSearchView(mapState: $mapState)
                    .edgesIgnoringSafeArea(.all)
                        .navigationBarBackButtonHidden(true)
                        .padding(.top, 23)

                
                }else if mapState == .noInput{
                    LocationSearchActivationView()
                        .padding(.top, 20)
                        .padding(.trailing, -60)
                        .onTapGesture {
                            withAnimation(.spring())
                            {
                                mapState = .searchingForLocation
                            }}
                }
              
                        MapViewActionButton(mapState: $mapState)
                        .padding(.top, 23)
                        
                        
                    }
                
             if mapState == .loctionSelected{
                
                    RideRequestView()
                        .transition(.move(edge: .bottom))
                        .padding(.bottom ,10)
                
            }
            } .edgesIgnoringSafeArea(.bottom)
            .navigationBarBackButtonHidden(true)
            
            
        }
        }




struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
    HomeView()
    }
}

