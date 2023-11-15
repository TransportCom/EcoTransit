///
//  DriverResultCell.swift
//  EcoTransit
//
//  Created by imba on 12/11/2023.
//

import SwiftUI

// Assuming you have an asset catalog for driver images
struct DriverResultCell: View {
    let driver: DriverModel
    
    var body: some View {
        HStack {
            Image(driver.imageName) 
                .resizable()
                .frame(width: 40, height: 40)
                .clipShape(Circle())
            
            VStack(alignment: .leading, spacing: 4) {
                Text(driver.name)
                    .font(.body)
                Text(driver.location)
                    .font(.system(size: 15))
                    .foregroundColor(.gray)
                Divider()
            }
        }
        .padding(.leading, 8)
        .padding(.vertical, 8)
    }
}

struct DriverResultCell_Previews: PreviewProvider {
    static var previews: some View {
        DriverResultCell(driver: DriverModel(
            id: 1,
            name: "imen test",
            location: "location 1, testestets",
            imageName: "driver_profile_image",
            description: "Driver description",
            reviews: "5",
            rideType: .taxi
        ))
    }
}
