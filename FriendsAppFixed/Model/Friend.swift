//
//  Friend.swift
//  FriendsApp
//
//  Created by Sabrina C. Sales on 05/08/2023.
//

import Foundation
import SwiftUI

struct Friend: Identifiable, Codable, Hashable {
    
    
    
    
    
    var id = UUID()
    var name: String
    var desc: String
    var element: Element
    var weapon: Weapon
    
    var baseAtk: Int
    var maxHp: Int
   
   
    
    var color: Color {
        switch element {
        case .pyro: return Color("pyro")
        case .cryo: return Color("cryo")
        case .hydro: return Color("hydro")
        case .dendro: return Color("dendro")
        case .electro: return Color("electro")
        case .geo: return Color("geo")
        case .anemo: return Color("anemo")
        }
    }
    
    var typeText :String {
        switch element {
        case .pyro: return "pyro"
        case .cryo: return "cryo"
        case .hydro: return  "hydro"
        case .dendro: return  "dendro"
        case .electro: return "electro"
        case .geo: return "geo"
        case .anemo: return "anemo"
        }
    }
    
    var icon : String {
        switch element {
        case .pyro: return "flame"
        case .cryo: return "snowflake"
        case .hydro: return  "drop"
        case .dendro: return  "leaf"
        case .electro: return "bolt"
        case .geo: return "shield"
        case .anemo: return "wind"
        }
    }
   
}
