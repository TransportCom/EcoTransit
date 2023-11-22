//
//  webservice.swift
//  ecotransit
//
//  Created by Mohamed Achi on 18/11/2023.
//

import Foundation
import GoogleSignIn
import GoogleSignInSwift

class WebService {
    private let session: URLSession

    init() {
            let configuration = URLSessionConfiguration.default
            configuration.timeoutIntervalForRequest = 30 // seconds
            configuration.timeoutIntervalForResource = 60 // seconds
            self.session = URLSession(configuration: configuration)
        }

    
    
    
    func signUp(email: String, password: String,tel:String ,nom: String, prenom: String ,completion: @escaping (Bool, Error?) -> Void) {
        let url = URL(string: "http://localhost:4000/s/api/user/signup")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        let parameters: [String: Any] = [
            "email": email,
            "password": password,
              "name": prenom,
              "lastname": nom,
              "verified": true,
            "role": "USER",
              "tel": tel ,
        ]
        
        let jsonData = try? JSONSerialization.data(withJSONObject: parameters)
        request.httpBody = jsonData
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let session = URLSession.shared
        let task = session.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(false, error)
                return
            }
            if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 201 {
                completion(true, nil)
            } else {
                completion(false, nil)
            }
        }
        task.resume()
    }
    func signIn(email: String, password: String, completion: @escaping (Result<LoginPageModel, Error>) -> Void) {
        guard let url = URL(string: "http://localhost:4000/s/api/user/signin") else {
            completion(.failure(URLError(.badURL)))
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"

        let parameters: [String: Any] = [
            "email": email,
            "password": password,
        ]
        
        request.httpBody = try? JSONSerialization.data(withJSONObject: parameters)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        let session = URLSession.shared
        let task = session.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                completion(.failure(URLError(.badServerResponse)))
                return
            }
            
            guard let mimeType = httpResponse.mimeType, mimeType == "application/json",
                  let data = data else {
                completion(.failure(URLError(.cannotParseResponse)))
                return
            }
            
            do {
                if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                    let token = json["token"] as? String,
                    let nom = json["name"] as? String,
                    let prenom = json["lastname"] as? String,
                    let role = json["role"] as? String,
                    let tel = json["tel"] as? String,
                    let email = json["email"] as? String{  // Make sure this key matches what your API sends
                    let loginModel : LoginPageModel = LoginPageModel()
                    UserDefaults.standard.set(token, forKey: "tokenAuth")
                    loginModel.token = token
                    loginModel.nom = nom
                    loginModel.prenom = prenom
                    loginModel.role = role
                    loginModel.email = email
                    loginModel.tel = tel
                    completion(.success(loginModel))
                  
                } else {
                    completion(.failure(URLError(.cannotParseResponse)))
                }
            }catch {
                completion(.failure(error))
            }
            
        }

        task.resume()
    }

    func profile(token: String, completion: @escaping (Result<LoginPageModel, Error>) -> Void) {
        guard let url = URL(string: "http://localhost:4000/s/api/profile/") else {
            completion(.failure(URLError(.badURL)))
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        print("TOKEN: \(token)")
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")

        let session = URLSession.shared
        let task = session.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                completion(.failure(URLError(.badServerResponse)))
                return
            }
            
            guard let mimeType = httpResponse.mimeType, mimeType == "application/json",
                  let data = data else {
                completion(.failure(URLError(.cannotParseResponse)))
                return
            }
            
            do {
                if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                    let nom = json["name"] as? String,
                    let prenom = json["lastname"] as? String,
                    let role = json["role"] as? String,
                    let tel = json["tel"] as? String,
                    let email = json["email"] as? String{  // Make sure this key matches what your API sends
                    let loginModel : LoginPageModel = LoginPageModel()
                    UserDefaults.standard.set(token, forKey: "tokenAuth")
                    loginModel.nom = nom
                    loginModel.prenom = prenom
                    loginModel.role = role
                    loginModel.email = email
                    loginModel.tel = tel
                    completion(.success(loginModel))
                  
                } else {
                    completion(.failure(URLError(.cannotParseResponse)))
                }
            }catch {
                completion(.failure(error))
            }
            
        }

        task.resume()
    }

    
   

}
