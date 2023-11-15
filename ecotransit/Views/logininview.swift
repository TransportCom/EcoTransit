//
//  LoginInView.swift
//  ecotransit
//
//  Created by Mohamed Achi on 4/11/2023.
//

import SwiftUI
import LocalAuthentication
import CoreData

struct Role: Identifiable {
    let id = UUID()
    var imageName: String
    let title: String
}

 

struct LoginInView: View {
    @State private var roleList: [Role] = [
           Role(imageName: "entreprise", title: "entreprise"),
           Role(imageName: "chauffeur", title: "chauffeur") ,
           Role(imageName: "voyageur", title: "voyageur") ,
           // Add more roles as needed
       ]
        
    @AppStorage("stored_User") var user = "STORED_EMAIL_ID"
    @AppStorage("status") var logged = false
  
    @StateObject var loginData: LoginPageModel = LoginPageModel()
    var body: some View {
        
        VStack{
            if loginData.registerUser{
                Text("welcome give us your info")
                    .transition(.scale)
                    .font(.custom(customFont, size: 30).bold())
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity,alignment: .leading)
                    .padding(.horizontal , 50)
            }
            else if loginData.role_status{
                Text("what kind of user are you ? ")
                    .transition(.scale)
                    .font(.custom(customFont, size: 30).bold())
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity,alignment: .leading)
                    .padding(.horizontal , 50)
            }
            else if loginData.Forgot_pass{
                Text("No problem, Enter your Email ")
                    .transition(.scale)
                    .font(.custom(customFont, size: 30).bold())
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity,alignment: .leading)
                    .padding(.horizontal , 50)
            }
            else{
                Text("The Solution To\nTransport")
                    .transition(.move(edge: .bottom))
                
                    .font(.custom(customFont, size: 55).bold())
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity,alignment: .leading)
                    .frame(height: getRect().height / 3.5)
                    .padding(.horizontal , 40)
                    .background(
                        
                        ZStack{
                            
                            // Gradient Circle...
                            LinearGradient(colors: [
                                
                                Color("background"),
                                .white
                                    .opacity(0.8),
                               Color("background2")
                            ], startPoint: .top, endPoint: .bottom)
                            .frame(width: 100, height: 100)
                            .clipShape(Circle())
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
                            .padding(.trailing)
                            .offset(y: -25)
                            .ignoresSafeArea()
                            
                            Circle()
                                .strokeBorder(Color.white.opacity(0.3),lineWidth: 3)
                                .frame(width: 30, height: 30)
                                .blur(radius: 2)
                                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
                                .padding(30)
                            
                            Circle()
                                .strokeBorder(Color.white.opacity(0.3),lineWidth: 3)
                                .frame(width: 23, height: 23)
                                .blur(radius: 2)
                                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                                .padding(.leading,30)
                        }
                    )
            }
            ScrollView(.vertical, showsIndicators: false) {
                
                // Login Page Form....
                VStack(spacing: 15){
                    if (loginData.role_status == false ){
                        Text(loginData.registerUser ? "Register" : "Login")
                            .font(.custom(customFont, size: 22).bold())
                            .frame(maxWidth: .infinity,alignment: .leading)
                    }
                    // Custom Text Field...
                    if (loginData.role_status == false){
                        CustomTextField(icon: "envelope", title: "Email", hint: "justine@gmail.com", value: $loginData.email, showPassword: .constant(false))
                            .padding(.top,30)
                        if (loginData.Forgot_pass == false){
                            CustomTextField(icon: "lock", title: "Password", hint: "123456", value: $loginData.password , showPassword: $loginData.showPassword)
                                .padding(.top,10)
                        }
                        // Regsiter Reenter Password
                        if loginData.registerUser{
                            CustomTextField(icon: "lock", title: "Re-Enter Password", hint: "123456", value: $loginData.re_Enter_Password, showPassword: $loginData.showReEnterPassword)
                                .padding(.top,10)
                            CustomTextField(icon: "phone", title: "Numero de telephone", hint: "123456", value: $loginData.tel,  showPassword: .constant(false))
                                .padding(.top,10)
                            CustomTextField(icon: "person", title: "prenom", hint: "123456", value: $loginData.prenom, showPassword: .constant(false))
                                .padding(.top,10)
                            CustomTextField(icon: "person", title: "nom", hint: "123456", value: $loginData.nom, showPassword: .constant(false))
                                .padding(.top,10)
                        }
                        if ((loginData.registerUser == false)&&(loginData.role_status == false)&&(loginData.Forgot_pass == false) ){
                            // Forgot Password Button...
                            Button {
                            loginData.ForgotPassword()
                        } label: {
                            
                            Text("Forgot password?")
                                .font(.custom(customFont, size: 14))
                                .fontWeight(.semibold)
                                .foregroundColor(Color("background2"))
                        }
                        .padding(.top,8)
                        .frame(maxWidth: .infinity,alignment: .leading)
                    }
                    }
                    // Login Button...
                    if loginData.registerUser&&(loginData.role_status == false){
                        Button {
                            if loginData.registerUser{
                                loginData.rolee()
                            }
                            else{
                                loginData.Login()
                            }
                        }
                        
                    label: {
                            
                            Text("Sign up")
                                .font(.custom(customFont, size: 17).bold())
                                .padding(.vertical,20)
                                .frame(maxWidth: .infinity)
                                .foregroundColor(.white)
                                .background(Color("background")
                                )
                                .cornerRadius(15)
                                .shadow(color: Color.black.opacity(0.07), radius: 5, x: 5, y: 5)
                        }
                        .padding(.top,25)
                        .padding(.horizontal)
                    }
                    else if (loginData.registerUser == false)&&(loginData.role_status == false)&&(loginData.Forgot_pass == false){
                        Button {
                            if loginData.registerUser{
                                loginData.Register()
                            }
                            else{
                                loginData.Login()
                            }
                        } label: {
                            
                            Text("Login")
                                .font(.custom(customFont, size: 17).bold())
                                .padding(.vertical,20)
                                .frame(maxWidth: .infinity)
                                .foregroundColor(.white)
                                .background(Color("background")
                                )
                                .cornerRadius(15)
                                .shadow(color: Color.black.opacity(0.07), radius: 5, x: 5, y: 5)
                        }
                        .padding(.top,25)
                        .padding(.horizontal)
                        
                        if loginData.Forgot_pass{
                            Button {
                            
                                loginData.sendemail()
                            }
                        label: {
                            
                            Text("Login")
                                .font(.custom(customFont, size: 17).bold())
                                .padding(.vertical,20)
                                .frame(maxWidth: .infinity)
                                .foregroundColor(.white)
                                .background(Color("background")
                                )
                                .cornerRadius(15)
                                .shadow(color: Color.black.opacity(0.07), radius: 5, x: 5, y: 5)
                        }}
                    }
                    if loginData.role_status{
                        
                        ForEach(roleList) { role in
                                         RecentlyBookedRole(role: role)
                                     }
                    }
                    if (loginData.registerUser == false)&&(loginData.role_status == false)&&(loginData.Forgot_pass == false){
                        Text("                        or ")
                            .foregroundColor(Color("background"))
                            .font(.system(size: 30))
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                            .padding(.horizontal, 20)
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
                        
                        Button(action: authenticateUser, label: {
                            
                            // getting biometrictype...
                            Image(systemName: LAContext().biometryType == .faceID ? "faceid" : "touchid")
                                .font(.title)
                                .foregroundColor(.black)
                                .padding()
                                .background(Color("background"))
                                .clipShape(Circle())
                        })
                    }
                    
                    // Register User Button...
                    if (loginData.role_status == false){
                        Button {
                            withAnimation{
                                loginData.registerUser.toggle()
                                loginData.Forgot_pass = false

                            }
                        } label: {
                            
                            Text(loginData.registerUser ? "Back to login" : "Create account")
                                .font(.custom(customFont, size: 14))
                                .fontWeight(.semibold)
                                .foregroundColor(Color("background"))
                        }
                        .padding(.top,8)
                    }
                    if loginData.role_status{
                        Button {
                            withAnimation{
                                loginData.registerUser.toggle()
                                loginData.role_status.toggle()
                            }
                        } label: {
                            
                            Text(loginData.registerUser ? "Back to login" : "Create account")
                                .font(.custom(customFont, size: 14))
                                .fontWeight(.semibold)
                                .foregroundColor(Color("background"))
                        }
                    }
                }
                .padding(30)
            }
            .frame(maxWidth: .infinity,maxHeight: .infinity)
            .background(
                Color.white
                // Applying Custom Corners...
                    .clipShape(CustomCorners(corners: [.topLeft,.topRight], radius: 60))
                    .ignoresSafeArea()
            )
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("background"))
        
        
        .onChange(of: loginData.registerUser) { newValue in
            
            loginData.email = ""
            loginData.password = ""
            loginData.re_Enter_Password = ""
            loginData.showPassword = false
            loginData.showReEnterPassword = false
        }
    }
    
    @ViewBuilder
    func CustomTextField(icon: String,title: String,hint: String,value: Binding<String>,showPassword: Binding<Bool>)->some View{
        
        VStack(alignment: .leading, spacing: 12) {
            
            Label {
                Text(title)
                    .font(.custom(customFont, size: 14))
            } icon: {
                Image(systemName: icon)
            }
            .foregroundColor(Color.black.opacity(0.8))
            
            if title.contains("Password") && !showPassword.wrappedValue{
                SecureField(hint, text: value)
                    .padding(.top,2)
            }
            else{
                TextField(hint, text: value)
                    .padding(.top,2)
            }
            
            Divider()
                .background(Color.black.opacity(0.4))
        }
        // Showing Show Button for password Field...
        .overlay(
        
            Group{
                
                if title.contains("Password"){
                    Button(action: {
                        showPassword.wrappedValue.toggle()
                    }, label: {
                        Text(showPassword.wrappedValue ? "Hide" : "Show")
                            .font(.custom(customFont, size: 13).bold())
                            .foregroundColor(Color("background"))
                    })
                    .offset(y: 8)
                }
            }
            
            ,alignment: .trailing
        )
    }
    
    func getBioMetricStatus()->Bool{
        
        let scanner = LAContext()
        if loginData.email == user && scanner.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: .none){
            
            return true
        }
        
        return false
    }
    
    // authenticate User...
    
    func authenticateUser(){
        
        let scanner = LAContext()
        scanner.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "To Unlock \(loginData.email)") { (status, err) in
            if err != nil{
                print(err!.localizedDescription)
                return
            }
            
            // setting logged status as true...
            withAnimation(.easeOut){loginData.log_Status = true}
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
    LoginInView()
}

