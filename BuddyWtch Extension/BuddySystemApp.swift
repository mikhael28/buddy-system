//
//  BuddySystemApp.swift
//  BuddyWtch Extension
//
//  Created by Mikha'el on 6/19/21.
//

import SwiftUI

@main
struct BuddySystemApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
