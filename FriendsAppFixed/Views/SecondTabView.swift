//
//  SecondTabView.swift
//  FriendsApp
//
//  Created by Sabrina C. Sales on 06/08/2023.
//

import SwiftUI

struct SecondTabView: View {
    @ObservedObject var friendManager: FriendManager
    
    var body: some View {
        VStack {
            Text("You have added")
                .font(.system(.title))
                .padding()
            Text("\(friendManager.friends.count)")
                .font(.system(size: 70))
                .padding()
                .bold()
                .foregroundColor(.blue)
            Text(friendManager.friends.count == 1 ? "friend." : "friends")
                .font(.system(.title))
                .padding()
            Text("\(friendManager.message)")
                .font(.system(.subheadline))
                .padding()
        }
    }
}

struct SecondTabView_Previews: PreviewProvider {
    static var previews: some View {
        SecondTabView(friendManager: FriendManager())
    }
}
