//
//  Weapon.swift
//  FriendsApp
//
//  Created by Sabrina C. Sales on 06/08/2023.
//

import Foundation

public enum Weapon: CaseIterable, Codable {
    case sword, claymore, polearm, bow, catalyst
    
    func stringValue() -> String {
        switch(self) {
        case .sword:
            return "Sword"
        case .claymore:
            return "Claymore"
        case .polearm:
            return "Polearm"
        case .bow:
            return "Bow"
        case .catalyst:
            return "Catalyst"
            
        }
        
    }
}
