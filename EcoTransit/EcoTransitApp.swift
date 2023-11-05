//
//  EcoTransitApp.swift
//  EcoTransit
//
//  Created by imba on 4/11/2023.
//

import SwiftUI

@main
struct EcoTransitApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            Location()
                      .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
