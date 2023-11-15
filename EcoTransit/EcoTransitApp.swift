//
//  EcoTransitApp.swift
//  EcoTransit
//
//  Created by imba on 4/11/2023.
//
import SwiftUI
import Firebase

@main
struct EcoTransitApp: App {
    @StateObject var locationViewModel = LocationSearchViewModel()
    let persistenceController = PersistenceController.shared

    init() {
        FirebaseApp.configure()
    }

    var body: some Scene {
        WindowGroup {
           DriverHomeView()
                .environmentObject(locationViewModel)
        }
    }
}




/*class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
content_copy

    return true
  }
}


@main
struct EcoTransitApp: App {
   // @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentChatView()
        }
    }
}
*/
