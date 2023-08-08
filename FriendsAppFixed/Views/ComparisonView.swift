//
//  ComparisonView.swift
//  FriendsAppFixed
//
//  Created by Sabrina C. Sales on 08/08/2023.
//

import SwiftUI

struct ComparisonView: View {
    
    @ObservedObject var friendManager: FriendManager
    
    @State var friend1: Friend? = nil
    @State var friend2: Friend? = nil
    
    var body: some View {
        NavigationStack {
            if friendManager.friends.isEmpty {
                VStack {
                Image(systemName: "person.fill.questionmark")
                        .font(.system(size: 60))
                        .padding()
                    Text("No friends to compare :(")
                    Text("Add a few in first!")
                        .navigationTitle("Friends")
                }
                .foregroundColor(.gray)
                //.font(.footnote)
            } else {
                VStack {
                    HStack {
                        ComparisonTileView(friend: $friend1, friendNumber: 1)
                        ComparisonTileView(friend: $friend2, friendNumber: 2)
                    }
                    .padding(5)
                    HStack{
                        Picker("Friend 1", selection: $friend1) {
                            ForEach(friendManager.friends, id: \.self) { friend in
                                Text("\(friend.name)").tag(friend as Friend?)
                            }
                        }
                        Picker("Friend 2", selection: $friend2) {
                            ForEach(friendManager.friends, id: \.self) { friend in
                                Text("\(friend.name)").tag(friend as Friend?)
                            }
                        }
                    }
                    .navigationTitle("Friends")
                }
            }
        }
    }
}

struct ComparisonView_Previews: PreviewProvider {
    static var previews: some View {
        ComparisonView(friendManager: FriendManager())
    }
}
