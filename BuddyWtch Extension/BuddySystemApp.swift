//
//  BuddySystemApp.swift
//  BuddyWtch Extension
//
//  Created by Mikha'el on 6/19/21.
//

import SwiftUI

@main
struct BuddySystemApp: App {
    @ObservedObject private var data = EventData()
//    Scenebuilder object introduces glitch
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView(events: $data.events) {
                    data.save()
                }
            }
            .onAppear {
                data.load()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
