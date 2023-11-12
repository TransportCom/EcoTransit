//
//  Message.swift
//  EcoTransit
//
//  Created by imba on 10/11/2023.
//

import Foundation

struct Message: Identifiable, Codable {
    var id: String
    var text: String
    var received: Bool
    var timestamp: Date
}
