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
    @StateObject var loginPageModel = LoginPageModel()


    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(loginPageModel)

        }
    }
}
