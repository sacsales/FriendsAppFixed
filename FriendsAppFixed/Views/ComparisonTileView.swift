//
//  ComparisonTileView.swift
//  FriendsAppFixed
//
//  Created by Sabrina C. Sales on 08/08/2023.
//

import SwiftUI

struct ComparisonTileView: View {
    
    @Binding var friend: Friend?
    @State var friendNumber: Int
    var body: some View {
        NavigationStack {
            if let friend {
                List {
                    
                    Section {
                        Text("\(friend.name)")
                            .bold()
                            .font(.title2)
                        Text("\(friend.desc)")
                    }
                    Section {
                        HStack {
                            Text("\(friend.element.stringValue())")
                            Image(systemName: friend.icon)
                                .foregroundColor(friend.color)
                                .font(.body)
                        }
                        Text("\(friend.weapon.stringValue())")
                    }
                    
                    Section {
                        Text("ATK \(friend.baseAtk)")
                        Text("Max HP \(friend.maxHp)")
                    }
                }
                
                .scrollContentBackground(.hidden)
                .background(Rectangle().fill(friend.color).opacity(0.8).cornerRadius(12))
                
            } else {
                VStack {
                    Image(systemName: "person")
                        .font(.system(size: 60))
                        .padding()
                    Text("Choose friend #\(friendNumber)")
                       
                }
                .padding()
                .background(.gray)
                .foregroundColor(.white)
                .bold()
                .cornerRadius(12)
            }
            
        }
        
    }
}

struct ComparisonTileView_Previews: PreviewProvider {
    static var previews: some View {
        //ComparisonTileView(friend: .constant(Friend(name: "Sabrina", desc: "the one and only", element: .dendro, weapon: .catalyst, baseAtk: 300, maxHp: 18000)))
        ComparisonTileView(friend: .constant(nil), friendNumber: 1)
    }
}
