//
//  LoginPageModel.swift
//  EcommerceAppKit (iOS)
//
//  Created by Balaji on 26/11/21.
//

import SwiftUI

class LoginPageModel: ObservableObject {
    
    // Login Properties..
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var showPassword: Bool = false
    @Published var prenom : String = ""
    @Published var tel: String = ""
    @Published var nom : String = ""
    @Published var role : String = ""
    
    // Register Properties
    @Published var registerUser: Bool = false
    @Published var re_Enter_Password: String = ""
    @Published var showReEnterPassword: Bool = false
    @Published var role_status: Bool = false
    @Published var Forgot_pass: Bool = false

    // Log Status...
    @AppStorage("log_Status") var log_Status: Bool = false
    
    // Login Call...
    func Login(){
        // Do Action Here...
        withAnimation{
            log_Status = true
        }
    }
    func rolee(){
        // Do Action Here...
        withAnimation{
            role_status = true
            
        }
    }
    func rolechosen(rchosen: String)
    {
        withAnimation{
            role = rchosen
        }
       
    }

    func Register(){
        // Do Action Here...
        withAnimation{
            log_Status = true
        }
    }
    
    func ForgotPassword(){
        withAnimation{
            Forgot_pass = true
        }
    }
    func sendemail(){
        withAnimation{
            Forgot_pass = false
        }
    }
}
