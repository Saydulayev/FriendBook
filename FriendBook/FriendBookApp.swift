//
//  FriendBookApp.swift
//  FriendBook
//
//  Created by Saydulayev on 17.12.24.
//

import SwiftUI
import SwiftData

@main
struct FriendBookApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: [User.self, Friend.self])
    }
}
