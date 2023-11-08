//
//  RideType.swift
//  EcoTransit
//
//  Created by imba on 8/11/2023.
//

import Foundation
enum RideType: Int, CaseIterable, Identifiable {
case collectiveTaxi
case taxi
case bus
    
    

var id: Int {return rawValue }
var description: String {switch self{
case .collectiveTaxi : return "collectiveTaxi"
    case .taxi: return "taxi"
    case .bus: return "bus"}}
var imageName: String {switch self{
case .collectiveTaxi : return "collectiveTaxi"
    case .taxi: return "taxi1"
    case .bus: return "bus"}}
}
