//
//  SideMenuRowType.swift
//  ecotransit
//
//  Created by Mohamed Achi on 8/11/2023.
//

import Foundation

enum SideMenuRowType: Int, CaseIterable{
    case home = 0
    case favorite
    case profile
    case login
    var title: String{
        switch self {
        case .home:
            return "Home"
        case .favorite:
            return "Favorite"
        case .profile:
            return "Profile"
        case .login:
            return "logout"
        }
    }
    
    var iconName: String{
        switch self {
        case .home:
            return "home"
        case .favorite:
            return "favorite"
        case .profile:
            return "profile"
        case .login:
            return "logout"
        }
    }
}

