//
//  ecotransitApp.swift
//  ecotransit
//
//  Created by Mohamed Achi on 4/11/2023.
//

import SwiftUI

@main
struct ecotransitApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            MainTabbedView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
