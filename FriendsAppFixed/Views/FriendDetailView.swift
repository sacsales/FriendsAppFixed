//
//  FriendDetailView.swift
//  FriendsApp
//
//  Created by Sabrina C. Sales on 05/08/2023.
//

import SwiftUI

struct FriendDetailView: View {
    
    @Binding var friend: Friend
    
    var body: some View {
        
        Form {
            Section("Profile") {
                TextField("\(friend.name)", text: $friend.name)
                
                TextField("\(friend.desc)", text: $friend.desc)
            }
            Section ("Vision and Weapon") {
                    
                    Picker("Vision", selection: $friend.element) {
                        ForEach(Element.allCases, id: \.self) { element in
                            let displayText = element.stringValue()
                            Text("\(displayText)")
                        }
                    }
                    
                    
                
                Picker("Weapon", selection: $friend.weapon) {
                    ForEach(Weapon.allCases, id: \.self) { weapon in
                        let displayText = weapon.stringValue()
                        Text("\(displayText)")
                    }
                }
                
            }
            
            Section("Stats") {
                HStack {
                    Stepper("Base ATK", onIncrement: {
                        friend.baseAtk += 10
                    }, onDecrement: {
                        friend.baseAtk -= 10
                    })
                    Text("\(friend.baseAtk)")
                }
                
                HStack {
                    Stepper("Max HP", onIncrement: {
                        friend.maxHp += 100
                    }, onDecrement: {
                        friend.maxHp -= 100
                    })
                    Text("\(friend.maxHp)")
                }
                
            }
            
            
        }
        .background(friend.color.opacity(0.8))
        
    
        .scrollContentBackground(.hidden)
        .navigationTitle("Friend Detail")
        
        
    }
}

struct FriendDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FriendDetailView(friend: .constant(Friend(name: "Sabrina", desc: "the one and only!", element: .dendro, weapon: .catalyst, baseAtk: 370, maxHp: 12000)))
    }
}
