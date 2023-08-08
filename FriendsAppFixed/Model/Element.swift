//
//  Element.swift
//  FriendsApp
//
//  Created by Sabrina C. Sales on 06/08/2023.
//

import Foundation

public enum Element: CaseIterable, Codable {
    case pyro, hydro, cryo, dendro, electro, geo, anemo
    
    func stringValue() -> String {
            switch(self) {
            case .pyro:
                return "Pyro"
            case .hydro:
                return "Hydro"
            case .cryo:
                return "Cryo"
            case .dendro:
                return "Dendro"
            case .electro:
                return "Electro"
            case .geo:
                return "Geo"
            case .anemo:
                return "Anemo"
            }
        }
}
