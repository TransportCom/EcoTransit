//
//  RideRequestView.swift
//  EcoTransit
//
//  Created by imba on 8/11/2023.
//


import SwiftUI

struct RideRequestView: View {
    var body: some View {
        VStack {
            Capsule()
                .foregroundColor(Color(.systemGreen))
                .frame(width: 48, height: 6)
            
            HStack {
                
                VStack {
                    
                    HStack {
                        VStack {
                            Circle()
                                .fill(Color(.systemGray3))
                                .frame(width: 8, height: 8)
                            Rectangle()
                                .fill(Color(.systemGray3))
                                .frame(width: 1, height: 32)
                            Rectangle()
                                .fill(.black)
                                .frame(width: 8, height: 8)
                        }
                    }.padding(10)
                }
                
                VStack(alignment: .leading, spacing: 24) {
                    HStack {
                        Text("Current location")
                            .font(.system(size: 16))
                            .foregroundColor(.gray)
                        Spacer()
                        Text("1:30 PM")
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(.gray)
                    }
                    .padding(10)
                    
                    HStack {
                        Text("Starbucks Coffee")
                            .font(.system(size: 16,weight: .bold))
                            .foregroundColor(.green)
                        Spacer()
                        Text("1:45 PM")
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(.gray)
                    }.padding(10)
                }
                    .padding(.leading,10)
                }
                    
                    Divider()
                .padding(.vertical, 18)
            Text ("SUGGESTED RIDES")
              .font (. subheadline)
              .fontWeight(.semibold)
              .padding()
              .foregroundColor(.gray)
              .frame(maxWidth: .infinity, alignment: .leading)
          ScrollView( .horizontal) {
              HStack (spacing: 12) {
                  ForEach(0 ..< 10, id: \.self)
                  { _ in
                      VStack(alignment:
                              .leading) {
                                  Image (systemName: "car")
                                      .resizable()
                                      .scaledToFit()
                                  VStack(spacing: 5) {
                                      Text("Cars")
                                          .font(.system(size: 14, weight: .semibold))
                                      .foregroundColor(.gray)
                                  
                                  Text("50DT")
                                      .font(.system(size: 14, weight: .semibold))
                                  }
                                  .padding(8)
                              }
                              .frame(width: 120,height: 140)
                              .background(Color(.systemGroupedBackground))
                              .cornerRadius(10)
                  }
              }
          }
          .padding(.horizontal)
                    
            
            Button {
            } label: {
                Text("Confirm Ride")
                    .fontWeight(.bold)
                    .frame(width: UIScreen.main.bounds.width -
                           32, height: 50)
                    .background(.green)
                    .cornerRadius(10)
                    .foregroundColor(.white)
            }
                }
        .background(.white)
            }
        }
    

    struct RideRequestView_Previews: PreviewProvider {
        static var previews: some View {
            RideRequestView()
        }
    }

