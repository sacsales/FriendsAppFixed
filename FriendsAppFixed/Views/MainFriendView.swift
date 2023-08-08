//
//  MainFriendView.swift
//  FriendsAppFixed
//
//  Created by Sabrina C. Sales on 08/08/2023.
//

import SwiftUI

struct MainFriendView: View {
    
    @ObservedObject var friendManager: FriendManager
    @State private var showSheet = false
    @State private var showConfirmAlert = false
    
    var body: some View {
        NavigationStack {
            
            List($friendManager.friends, editActions: [.all]) { $friend in
                FriendRowView(friend: $friend)
                
            }
            .navigationTitle("Friends")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    
                    Button {
                        friendManager.clearAll()
                    } label: {
                        Image(systemName: "trash")
                    }
                    
                    Button {
                        showConfirmAlert = true
                    } label: {
                        Image(systemName: "clipboard")
                    }
                    
                    
                    Button {
                        showSheet = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
        .sheet(isPresented: $showSheet) {
            NewFriendView(sourceArray: $friendManager.friends)
        }
        .alert("Load sample data? Warning: All existing data will be deleted.", isPresented: $showConfirmAlert) {
            Button("Replace", role: .destructive) {
                friendManager.loadSampleData()
            }
            
        }
    }
}

struct MainFriendView_Previews: PreviewProvider {
    static var previews: some View {
        MainFriendView(friendManager: FriendManager())
    }
}
