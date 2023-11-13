//
//  DriverListView.swift
//  EcoTransit
//
//  Created by imba on 12/11/2023.
//

import SwiftUI

struct DriverListView: View {
    let drivers: [DriverModel] 
    
    var body: some View {
        NavigationView {
            List(drivers, id: \.id) { driver in
                NavigationLink(destination: DriverDetailsView(driverInfo: driver)) {
                    DriverResultCell(driver: driver)
                }
            }
            .navigationBarTitle("Drivers", displayMode: .inline)
     
        }
    }
}

struct DriverListView_Previews: PreviewProvider {
    static var previews: some View {
        DriverListView(drivers: [
            DriverModel(id: 1, name: "imen test", location: "location 1, testestets", imageName: "driver_profile_image", description: "Driver description", reviews: "5", rideType: .taxi),
           
        ])
    }
}
