//
//  RideDetailsView.swift
//  EcoTransit
//
//  Created by imba on 9/11/2023.
//
import SwiftUI

struct RideDetailsView: View {
    let ride: DriverModel

    var body: some View {
        VStack {
            Image(ride.imageName)
                .resizable()
                .scaledToFit()
                .frame(height: 200)

            Text(ride.name)
                .font(.title)
                .padding()

            Text("Phone Number: \(ride.phoneNumber)")
                .padding()

            Text("Review Score: \(ride.reviewScore)")
                .padding()

            Text(ride.driverDescription)
                .padding()

            NavigationLink(destination: ChatView(driverName: ride.name)) {
                Text("Chat with Driver")
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()

            Spacer()
        }
        .navigationBarTitle("Ride Details", displayMode: .inline)
    }
}
