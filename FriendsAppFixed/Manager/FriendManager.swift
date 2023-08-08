//
//  FriendManager.swift
//  FriendsApp
//
//  Created by Sabrina C. Sales on 06/08/2023.
//

import Foundation

import Foundation
import SwiftUI

class FriendManager: ObservableObject {
    @Published var friends: [Friend] = [] {
        didSet {
            save()
        }
    }
        
    init() {
        load()
    }
    
    var message: String {
        if friends.count == 0 {
            return "Add some friends in, or if you're lonely, load the sample data!"
        } else {
            return "Look at you, social butterfly!"
        }
    }
    
    func clearAll() {
        friends = []
    }
    func loadSampleData() {
        friends = Friend.sampleFriends
    }

    
    func getArchiveURL() -> URL {
        let plistName = "friends.plist"
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        
        return documentsDirectory.appendingPathComponent(plistName)
    }
    
    func save() {
        let archiveURL = getArchiveURL()
        let propertyListEncoder = PropertyListEncoder()
        let encodedFriends = try? propertyListEncoder.encode(friends)
        try? encodedFriends?.write(to: archiveURL, options: .noFileProtection)
    }
    
    func load() {
        let archiveURL = getArchiveURL()
        let propertyListDecoder = PropertyListDecoder()
                
        if let retrievedFriendData = try? Data(contentsOf: archiveURL),
            let friendsDecoded = try? propertyListDecoder.decode([Friend].self, from: retrievedFriendData) {
            friends = friendsDecoded
        }
    }
}
