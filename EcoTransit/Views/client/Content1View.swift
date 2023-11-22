//
//  ContentView.swift
//  ecotransit
//
//  Created by Mohamed Achi on 14/11/2023.
//


import SwiftUI
import CoreData

struct ContentView: View {
    // Log Status..
    @AppStorage("log_Status") var log_Status: Bool = false
    @AppStorage("loading") var isloading: Bool = false
    @AppStorage("token") var logger: String = ""
    @EnvironmentObject var login : LoginPageModel
    var body: some View {
        Group{
            if isloading{
                ProgressView("Signing Up...")
                    .progressViewStyle(CircularProgressViewStyle(tint: .green))
                    .foregroundColor(Color("background"))
                    .background(Color.white.opacity(0.5))
                    .cornerRadius(10)
                    .padding()
            }
            else{
                if log_Status{
                    MainView()
                        .onAppear(perform: {
                            let webservice = WebService()
                            webservice.profile(token: logger) { result in
                                DispatchQueue.main.async {
                                    switch result {
                                    case .success(let model):
                                        print("Logged in successfully, tokensss: \(model.token)")
                                        login.token = model.token
                                        login.nom = model.nom
                                        login.prenom = model.prenom
                                        login.email = model.email
                                        login.tel = model.tel
                                        login.role = model.role
                                        logger = login.token
                                        
                                        isloading = true
                                        
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                                            isloading = false
                                            login.Login()
                                        }
                                        
                                    case .failure(let error):
                                        print("An error occurred while signing in: \(error.localizedDescription)")
                                        
                                    }
                                }
                            }
                        })
                }
                else{
                    OnBoardingPage()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
