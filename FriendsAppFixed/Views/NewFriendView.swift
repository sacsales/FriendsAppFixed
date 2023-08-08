//
//  NewFriendView.swift
//  FriendsApp
//
//  Created by Sabrina C. Sales on 06/08/2023.
//

import SwiftUI

struct NewFriendView: View {
    
    @State private var name = ""
    @State private var desc = ""
    @State private var weapon: Weapon = .sword
    @State private var element: Element = .pyro
    @State private var baseAtk =  300
    @State private var maxHp = 15000
    
    @Binding var sourceArray: [Friend]
    
    @Environment(\.dismiss) var goAway
    
    
    var body: some View {
        Form {
            Section ("Profile") {
                TextField("Name", text: $name)
                TextField("Description", text: $desc)
            }
            Section ("Vision and Weapon") {
                Picker("Vision", selection: $element) {
                    ForEach(Element.allCases, id: \.self) { element in
                        let displayText = element.stringValue()
                        Text("\(displayText)")
                    }
                }
                
                Picker("Weapon", selection: $weapon) {
                    ForEach(Weapon.allCases, id: \.self) { weapon in
                        let displayText = weapon.stringValue()
                        Text("\(displayText)")
                    }
                }
                
               
                
                
            }
            
            Section("Stats") {
                HStack {
                    Stepper("Base ATK", onIncrement: {
                        baseAtk += 10
                    }, onDecrement: {
                        baseAtk -= 10
                    })
                    Text("\(baseAtk)")
                }
                
                HStack {
                    Stepper("Max HP", onIncrement: {
                        maxHp += 100
                    }, onDecrement: {
                        maxHp -= 100
                    })
                    Text("\(maxHp)")
                }
                
            }
            
            Section("Actions") {
                Button("Save") {
                    let friend = Friend(name: name, desc: desc, element: element, weapon: weapon, baseAtk: baseAtk, maxHp: maxHp)
                    sourceArray.append(friend)
                    goAway()
                }
                Button("Cancel", role: .destructive) {
                    goAway()
                }
            }
            
            
            
        }
        
        //.background(friend.color.opacity(0.8))
        .scrollContentBackground(.hidden)
        .navigationTitle("Friend Detail")
    }
}

struct NewFriendView_Previews: PreviewProvider {
    static var previews: some View {
        NewFriendView(sourceArray: .constant([]))
    }
}
