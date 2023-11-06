//
//  chooseRoleView.swift
//  ecotransit
//
//  Created by Mohamed Achi on 5/11/2023.
//

import SwiftUI
import CoreData

struct Role: Identifiable {
    let id = UUID()
    var imageName: String
    let title: String
}

struct chooseRoleView: View {
    @State private var username: String = ""
    
    @State private var roleList: [Role] = [
        Role(imageName: "entreprise", title: "entreprise"),
        Role(imageName: "chauffeur", title: "chauffeur") ,
        Role(imageName: "voyageur", title: "voyageur") ,
        // Add more roles as needed
    ]
    
    
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    Image("logo")
                        .resizable()
                        .frame(width: 60, height: 60)
                    Text("Eco-Transit")
                        .font(.title)
                }
                .textFieldStyle(CustomTextFieldStyle())
                .cornerRadius(10)
                .padding()
                
                HStack {
                    Text("Quel type de compte ?")
                        .font(.system(size: 22, weight: .semibold))
                    Spacer()
                    
                }
                .padding(.trailing, 20)
                
                ForEach(roleList) { role in
                    RecentlyBookedRole(role: role)
                }
                .padding(.trailing, 5)
            }
            .padding(.leading, 20)
        }
    }
}

struct RoleCard: View {
    let role: Role

    var body: some View {
        ZStack {
            Image(role.imageName)
                .resizable()
                .frame(width: 300, height: 300)
                .cornerRadius(10)

            VStack(alignment: .leading, spacing: 10) {
                Spacer()
                Text(role.title)
                    .font(.headline)
                    .foregroundColor(.black)
                    .cornerRadius(120)

            }
            .padding()
        }
        .frame(width: 100, height: 300)
    }
}

struct RecentlyBookedRole: View {
    let role: Role

    var body: some View {
        ZStack { Button(action: {}, label: {
            Color("background")
                .frame(width: 350, height: 150)
                .cornerRadius(15)
                    })
            

            HStack(spacing: 5) {
                Image(role.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .cornerRadius(10)

                VStack(alignment: .leading, spacing: 15) {
                    Text(role.title)
                        .font(.system(size: 23, weight: .semibold))
                }
                .frame(maxWidth: .infinity)
            }
            .padding(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 15))
        }
        .padding(.trailing, 20)
    }
}

struct CustomTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(EdgeInsets(top: 15, leading: 10, bottom: 15, trailing: 10))
            .background(
                RoundedRectangle(cornerSize: CGSize(width: 10, height: 10))
                    .fill(Color("background"))
            )
            .foregroundColor(Color.black)
    }
}


#Preview {
    
    chooseRoleView()
}
