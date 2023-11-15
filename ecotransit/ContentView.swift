//
//  ContentView.swift
//  ecotransit
//
//  Created by Mohamed Achi on 14/11/2023.
//


import SwiftUI

struct ContentView: View {
    // Log Status..
    @AppStorage("log_Status") var log_Status: Bool = false
    var body: some View {
        Group{
            if log_Status{
                MainView()
            }
            else{
                OnBoardingPage()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
