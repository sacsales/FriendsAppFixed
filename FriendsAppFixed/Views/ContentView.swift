//
//  ContentView.swift
//  FriendsAppFixed
//
//  Created by Sabrina C. Sales on 08/08/2023.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var friendManager = FriendManager()
    
    var body: some View {
        TabView {
            MainFriendView(friendManager: friendManager)
                .tabItem {
                    Label("Friends", systemImage: "person.fill")
                }

            SecondTabView(friendManager: friendManager)
                .tabItem {
                    Label("Counter", systemImage: "number.circle")
                }
            
            ComparisonView(friendManager: friendManager)
                .tabItem {
                    Label("Compare", systemImage: "square.split.2x1.fill")
                }
            

        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
