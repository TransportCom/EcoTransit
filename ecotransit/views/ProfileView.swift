//
//  ProfileView.swift
//  ecotransit
//
//  Created by Mohamed Achi on 8/11/2023.
//

import SwiftUI
import CoreData

struct profile: Identifiable {
    let id = UUID()
    var imageName: String
    let title: String
}

struct ProfileView: View {
    
    @Binding var presentSideMenu: Bool
    
    @State private var username: String = ""
    
    @State private var profileList: [profile] = [
        profile(imageName: "entreprise", title: "entreprise"),
        profile(imageName: "chauffeur", title: "chauffeur") ,
        profile(imageName: "voyageur", title: "voyageur") ,
        // Add more roles as needed
    ]
    
    
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    Button{
                        presentSideMenu.toggle()
                    } label: {
                        Image("logo")
                            .resizable()
                            .frame(width: 80, height: 80)
                    }
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
                
                ForEach(profileList) { profile in
                    Recently(profile: profile)
                }
                .padding(.trailing, 5)
            }
            .padding(.leading, 20)
        }
    }
}

struct optCard: View {
    let profile: profile

    var body: some View {
        ZStack {
            Image(profile.imageName)
                .resizable()
                .frame(width: 300, height: 300)
                .cornerRadius(10)

            VStack(alignment: .leading, spacing: 10) {
                Spacer()
                Text(profile.title)
                    .font(.headline)
                    .foregroundColor(.black)
                    .cornerRadius(120)

            }
            .padding()
        }
        .frame(width: 100, height: 300)
    }
}

struct Recently: View {
    let profile: profile

    var body: some View {
        ZStack { Button(action: {}, label: {
            Color("background")
                .frame(width: 350, height: 150)
                .cornerRadius(15)
                    })
            

            HStack(spacing: 5) {
                Image(profile.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .cornerRadius(10)

                VStack(alignment: .leading, spacing: 15) {
                    Text(profile.title)
                        .font(.system(size: 23, weight: .semibold))
                }
                .frame(maxWidth: .infinity)
            }
            .padding(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 15))
        }
        .padding(.trailing, 20)
       
    }
   
}

struct CustomTextprint: TextFieldStyle {
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
ProfileView(presentSideMenu: .constant(false))
}
