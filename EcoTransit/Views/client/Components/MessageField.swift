//
//  MessageDriverField.swift
//  EcoTransit
//
//  Created by imba on 10/11/2023.
//


import SwiftUI

 struct MessageField: View {
     @EnvironmentObject var messagesManager: MessagesManager
     @State private var message = ""

     var body: some View {
         HStack {
             // Custom text field created below
             CustomTextField(placeholder: Text("Enter your message here"), text: $message)
                 .frame(height: 52)
                 .disableAutocorrection(true)

             Button {
                 messagesManager.sendMessage(text: message)
                 message = ""
             } label: {
                 Image(systemName: "paperplane.fill")
                     .foregroundColor(.white)
                     .padding(10)
                     .background(Color.green.opacity(0.7))
                     .cornerRadius(50)
             }
         }
         .padding(.horizontal)
         .padding(.vertical, 10)
         .background(Color.gray.opacity(0.2))
         .cornerRadius(50)
         .padding()
     }
 }

 struct MessageField_Previews: PreviewProvider {
     static var previews: some View {
         MessageField()
             .environmentObject(MessagesManager())
     }
 }

 struct CustomTextField: View {
     var placeholder: Text
     @Binding var text: String
     var editingChanged: (Bool)->() = { _ in }
     var commit: ()->() = { }

     var body: some View {
         ZStack(alignment: .leading) {
             // If text is empty, show the placeholder on top of the TextField
             if text.isEmpty {
                 placeholder
                 .opacity(0.5)
             }
             TextField("", text: $text, onEditingChanged: editingChanged, onCommit: commit)
         }
     }
 }
