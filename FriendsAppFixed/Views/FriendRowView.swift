//
//  FriendRowView.swift
//  FriendsApp
//
//  Created by Sabrina C. Sales on 06/08/2023.
//

import SwiftUI

struct FriendRowView: View {
    
    @Binding var friend: Friend
    
    var body: some View {
        NavigationLink {
            FriendDetailView(friend: $friend)
        } label: {
            HStack {
                VStack (alignment: .leading) {
                    HStack {
                        Text("\(friend.name)")
                            .bold()
                            .font(.body)
                        Image(systemName: friend.icon)
                            .foregroundColor(friend.color)
                            .font(.body)
                        Text("\(friend.weapon.stringValue())")
                            
                            .bold()
                            .foregroundColor(.black)
                            .padding(3)
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(.black, lineWidth: 1)
                            )
                            
                        Text("ATK \(friend.baseAtk)")
                            .bold()
                            .foregroundColor(.white)
                            .padding(3)
                            .background(.blue)
                            .cornerRadius(5)
                            
                        Text("HP \(friend.maxHp)")
                            .bold()
                            .foregroundColor(.white)
                            .padding(3)
                            .background(.green)
                            .cornerRadius(5)
                          
                      
                            
                    }
                    .font(.system(size: 11))
                    Text("\(friend.desc)")
                        .foregroundColor(.gray)
                        .font(.footnote)
                    
                }
                
                
               
            }
        }
    }
}

struct FriendRowView_Previews: PreviewProvider {
    static var previews: some View {
        FriendRowView(friend: .constant(Friend(name: "Sabrina", desc: "the one and only", element: .dendro, weapon: .catalyst, baseAtk: 300, maxHp: 18000)))
    }
}
