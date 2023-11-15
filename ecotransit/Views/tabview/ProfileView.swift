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
                 
                    Text("Eco-Transit")
                        .font(.title)
                }
                .cornerRadius(10)
                .padding()
                VStack(alignment: .center){
                    HStack{
                        Spacer()
                        Image("profile-image")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 200, height: 200)
                            .overlay(
                                RoundedRectangle(cornerRadius: 150)
                                    .stroke(.green.opacity(0.5), lineWidth: 5)
                            )
                            .cornerRadius(150)
                        Spacer()
                    }
                    
                    Text("Muhammad Achi")
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(.black)
                    
                    Text("IOS Developer")
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(.black.opacity(0.5))
                }
                ScrollView(.horizontal, showsIndicators: false) {
                                  HStack(spacing: 50) {
                                      ForEach(profileList) { profile in
                                          optCard(profile: profile)
                                      }
                                  }
                              }

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
                .frame(width: 50, height: 50)
                .cornerRadius(10)

            VStack(alignment: .leading, spacing: 50) {
                Spacer()
                Text(profile.title)
                    .font(.system(size: 35))
                    .foregroundColor(.black)
                    .cornerRadius(10)

            }
            .padding()
        }
        .navigationBarHidden(true)
        .frame(width: 200, height: 300)
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
ProfileView()
}
