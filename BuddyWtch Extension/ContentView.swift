//
//  ContentView.swift
//  BuddyWtch Extension
//
//  Created by Mikha'el on 6/19/21.
//

import SwiftUI

struct ContentView: View {
    @Binding var events: [ServiceEvent]
    @Environment(\.scenePhase) private var scenePhase
    @State private var isPresented = false
    @State private var newEventData = ServiceEvent.Data()
    let saveAction: () -> Void
    
    var body: some View {
        List {
            ForEach(events) { event in
                    CardView(event: event)
                }
            }
        }
    }
