//
//  SignInView.swift
//  ecotransit
//
//  Created by Mohamed Achi on 4/11/2023.
//

//
//  LoginInView.swift
//  ecotransit
//
//  Created by Mohamed Achi on 4/11/2023.
//

import SwiftUI

struct SignInView: View {
    @State private var email: String = ""
    @State private var password : String = ""
    @State private var prenom : String = ""
    @State private var tel: String = ""
    @State private var nom : String = ""
    @State private var image : String = ""

    var body: some View {
        NavigationView{
            ZStack(alignment: .topLeading){
                VStack{
                    VStack(spacing: 50){
                        ZStack{
                            HStack(spacing: 0){
                                Image("logo")
                                    .resizable()
                                    .frame(width: 80, height: 80)
                                    .padding(.leading, 20)
                                    .cornerRadius(50)

                                Text("Welcome, \n Eco-transit")
                                    .foregroundColor(Color("background"))
                                    .font(.system(size: 35))
                                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                    .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                                    .padding(.horizontal, 20)
                            }
                            
                        }
                        VStack{
                            VStack(spacing: 20){
                              
                                CustomText(placeHolder: "nom", bColor: "text", tOpacity: 0.6, value: $nom)
                                    .padding(.horizontal, 10)
                                CustomText(placeHolder: "prenom", bColor: "text", tOpacity: 0.6, value: $prenom)
                                    .padding(.horizontal, 10)
                                CustomText(placeHolder: "email", bColor: "text", tOpacity: 0.6, value: $email)
                                    .padding(.horizontal, 10)
                                CustomText(placeHolder: "numero de telephone", bColor: "text", tOpacity: 0.6, value: $tel)
                                    .padding(.horizontal, 10)
                                CustomText(placeHolder: "prenom", bColor: "text", tOpacity: 0.6, value: $password)
                                    .padding(.horizontal, 10)
                                CustomText(placeHolder: "prenom", bColor: "text", tOpacity: 0.6, value: $prenom)
                                    .padding(.horizontal, 10)

                                
                            }
                            Spacer()
                            VStack{
                                Button(action: {}, label: {
                                    Text("Forget Password ?")
                                        .font(.system(size: 18))
                                        .foregroundColor(Color("background2"))
                                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                    
                                })
                                Button(action: {}, label: {
                                    CustomButton(title: "Sign up", bgColor: "background2")
                                    
                                })
                                Text("                        or ")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 30))
                                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                    .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                                    .padding(.horizontal, 20)
                                
                            }.padding(.horizontal, 20)
                            HStack{
                                Button(action: {}, label: {
                                    Image("fb")
                                        .resizable()
                                        .frame(width: 30, height: 30)
                                        .padding(.horizontal, 60)
                                        .padding(.vertical, 15)
                                        .background(Color("fbback"))
                                        .cornerRadius(15)
                                })
                                Spacer()
                                Button(action: {}, label: {
                                    Image("google")
                                        .resizable()
                                        .frame(width: 30, height: 30)
                                        .padding(.horizontal, 60)
                                        .padding(.vertical, 15)
                                        .background(Color("gback"))
                                        .cornerRadius(15)
                                })
                            }
                            .padding(.horizontal, 30)
                        }
                    }
                    Spacer()
              
                    .frame(height: 40)
                    .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: .infinity)
                    .ignoresSafeArea()
                }
            }
            .edgesIgnoringSafeArea(.bottom)
        }
        .navigationBarHidden(true)
    }}


#Preview {
    SignInView()
}
