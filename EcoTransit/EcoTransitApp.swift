//
//  ecotransitApp.swift
//  ecotransit
//
//  Created by Mohamed Achi on 4/11/2023.
//
import SwiftUI
import Firebase
import MapKit

@main
struct ecotransitApp: App {
    let persistenceController = PersistenceController.shared
    @StateObject var loginPageModel = LoginPageModel()
    @StateObject var locationViewModel = LocationSearchViewModel()



    init() {
        FirebaseApp.configure()
    }

    var body: some Scene {
        WindowGroup {
         //DriverWelcomeSwipeView()
          // StationsView(stationViewModel: StationViewModel())
            //StationsView(stationViewModel: StationViewModel())
           // HomeView(stationViewModel: StationViewModel())
     
            //.environmentObject(locationViewModel)
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(loginPageModel)
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
