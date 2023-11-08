//
//  ForgotPasswordView.swift
//  ecotransit
//
//  Created by Mohamed Achi on 6/11/2023.
//

import SwiftUI

struct ForgotPasswordView: View {
    @State private var email: String = ""
    @State private var password : String = ""
    var body: some View {
        NavigationView{
            ZStack(alignment: .topLeading){
                VStack{
                    VStack(spacing: 90){
                        ZStack{
                            Ellipse()
                                .frame(width:510,height: 478)
                                .padding(.leading, -200)
                                .foregroundColor(Color("background"))
                                .padding(.top, -200)
                            Ellipse()
                                .frame(width:458,height: 420)
                                .padding(.trailing, -500)
                                .foregroundColor(Color("background2"))
                                .padding(.top, -200)
                            VStack{
                                Image("logo")
                                    .resizable()
                                    .frame(width: 80, height: 80)
                                    .padding(.leading, 20)
                                    .cornerRadius(15)
                                    .padding(.horizontal, -200)
                                
                                Text("Please enter \n Your Email ")
                                    .foregroundColor(.white)
                                    .font(.system(size: 35))
                                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                    .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                                    .padding(.leading, 20)
                            }
                         
                        }
                        VStack(spacing: 40){
                            
                            VStack(spacing: 30){
                                CustomTextField(placeHolder: "Email", imageName: "envelope", bColor: "text", tOpacity: 0.6, value: $email)
                               
                                
                                
                            }
                            VStack{
                            
                                Button(action: {}, label: {
                                    CustomButton(title: "Recieve Email", bgColor: "background2")
                                    
                                })
                            }.padding(.horizontal, 20)
                          
                            .padding(.horizontal, 30)
                        }
                    }
                    Spacer()
                    HStack{
                        Text("Dont have an account")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .font(.system(size: 18))
                        
                        Button(action: {}, label: {
                            Text("Sign up")
                                .font(.system(size: 18))
                                .foregroundColor(Color("background2"))
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        })
                    }
                    .frame(height: 63)
                    .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: .infinity)
                    .background(Color("background"))
                    .ignoresSafeArea()
                }
                topbarview()
            }
            .edgesIgnoringSafeArea(.bottom)
        }
        .navigationBarHidden(false)
    }}
#Preview {
    ForgotPasswordView()
}
