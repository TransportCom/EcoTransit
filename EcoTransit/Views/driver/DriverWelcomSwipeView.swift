//
//  DriverWelcomSwipeView.swift
//  EcoTransit
//
//  Created by imba on 17/11/2023.
//

import SwiftUI

struct  DriverWelcomeSwipeView: View {
    private let views: [AnyView] = [
       
        AnyView(Swipe1View()),
        AnyView(Swipe2View())
    ]

    @State private var currentPage = 0

    var body: some View {
        ZStack {
            TabView(selection: $currentPage) {
                ForEach(0..<views.count, id: \.self) { index in
                    views[index]
                        .tag(index)
                }
            }
            .tabViewStyle(.page)
            
        

           
        }.navigationBarBackButtonHidden(true)
            .indexViewStyle(.page(backgroundDisplayMode: .never) )
    }
}
  



struct DriverWelcomeSwipeView_previews: PreviewProvider {
    static var previews: some View {
        DriverWelcomeSwipeView()
    }
}





