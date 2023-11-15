//
//  ClientDetailsView.swift
//  EcoTransit
//
//  Created by imba on 14/11/2023.
//
//
//  ClientDetailsView.swift
//  EcoTransit
//
//  Created by imba on 9/11/2023.
//

import SwiftUI

struct ClientDetailsView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var isChatViewPresented = false
    var clientInfo: ClientModel
  
    var body: some View {
        NavigationView {
            ZStack {
                VStack(alignment: .leading, spacing: 20) {
                    Spacer()
                    Image("client_image") // Replace with the actual image name or URL
                        .resizable()
                        .cornerRadius(32)
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 200)
                        .padding(.top, 20)
                  
                    HStack {
                        Text(clientInfo.name)
                            .font(.title)
                            .padding(.top, 16)
                        
                        Spacer()
                        
                        Button("Show Map") {
                            // Action to show the map
                            presentationMode.wrappedValue.dismiss()
                        }
                        .foregroundColor(Color.green)
                        .padding(.top, 16)
                    }
                  
                    
                    Text(clientInfo.location)
                        .foregroundColor(.gray)
                        .padding(.bottom, 10)
                   
                    Text(clientInfo.description)
                        Spacer()

                    HStack {
                        
                      
                        
                        Image(systemName: "phone")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundColor(Color.green)
                        
                        Spacer()
                        Button("Chat") {
                            // Action to start a chat
                            isChatViewPresented.toggle()
                        }
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(15)
                        .sheet(isPresented: $isChatViewPresented) {
                            ContentChatView()
                        }
                       
                    }
                }
                .padding(.horizontal, 15)
            }
            .background(Color.white)
            .cornerRadius(16)
            .padding(.horizontal, 16)
            .padding(.top, -10)
            .navigationBarTitle("client info", displayMode: .inline)
            .navigationBarBackButtonHidden(true)
           /* .navigationBarItems(leading: Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Image(systemName: "arrow.left")
                    .foregroundColor(Color.green)
            })*/
        }
    }
}

struct ClientDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ClientDetailsView(clientInfo: ClientModel(
            id: 1,
            name: "Client Client",
            location: "Tunis, Tunisie",
            imageName: "client_image",
            description: "blablalblablablablalblablablablalblablablablalblablablablalblablablablalblablablablalblablablablalblablablablalblablablablalblablablablalblablablablalblablablablalblablablablalblablablablalblabla"
        ))
    }
}
