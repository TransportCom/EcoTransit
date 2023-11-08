//
//  EcoTransitApp.swift
//  EcoTransit
//
//  Created by imba on 4/11/2023.
//

import SwiftUI

@main
struct EcoTransitApp: App {
    @StateObject var locationViewModel = LocationSearchViewModel()
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            WelcomeSwipeView()
                      .environmentObject(locationViewModel)
        }
    }
}
