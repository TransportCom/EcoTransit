//
//  FavoriteView.swift
//  ecotransit
//
//  Created by Mohamed Achi on 8/11/2023.
//

import SwiftUI

struct FavoriteView: View {
    
    
    var body: some View {
        VStack{
            HStack{
               
                Spacer()
            }
            
            Spacer()
            Text("Favorite View")
            Spacer()
        }      .navigationBarHidden(true)
        .padding(.horizontal, 24)
    }
}

#Preview {
    LoginInView()
}
