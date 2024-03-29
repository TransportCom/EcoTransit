//
//  LocationSearchResultCell.swift
//  EcoTransit
//
//  Created by imba on 5/11/2023.
//

import SwiftUI

struct LocationSearchResultCell: View {
    let title: String
    let subtitle: String
    var body: some View {
        HStack {
            Image (systemName: "mappin.circle.fill")
                .resizable()
                .foregroundColor(.green)
                .accentColor (.white)
                .frame (width:
                            40, height: 40)
            VStack (alignment: .leading, spacing: 4)
            {
                Text (title)
                    .font (.body)
                Text(subtitle)
                    .font (.system(size: 15))
                    .foregroundColor (.gray)
                Divider()
            }
        }
        .padding(.leading, 8)
        .padding(.vertical, 8)
        
    }
      
}

struct LocationSearchResultCell_Previews: PreviewProvider {
    static var previews: some View {
        LocationSearchResultCell(title: "imen test", subtitle: "location 1, testestets")
    }
}
