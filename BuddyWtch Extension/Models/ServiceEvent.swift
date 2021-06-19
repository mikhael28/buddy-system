//
//  ServiceEvent.swift
//  BuddyWtch Extension
//
//  Created by Mikha'el on 6/19/21.
//

import SwiftUI

struct ServiceEvent: Identifiable, Codable {
    let id: UUID
    var title: String
//    @TODO Needs to be a [Person] object, which has their profile info
//    Similar to TypeScript in the sense it wants me to put in an interface
    var attendees: [String]
    var date: Date
    var color: Color
    var lengthInMinutes: Int
    var history: [History]
    
//    The init function below is essentially a JavaScript constructor function, which is generating one of these items using the initialized data
    
    init(id: UUID = UUID(), title: String, attendees: [String], lengthInMinutes: Int, color: Color, date: Date = Date(), history: [History] = []) {
        self.id = id
        self.title = title
        self.attendees = attendees
        self.lengthInMinutes = lengthInMinutes
        self.color = color
        self.date = date
        self.history = history
    }
}

// this is static data that we are pre-populating with, the TYPE of events we want

extension ServiceEvent {
    static var data: [ServiceEvent] {
        [
            ServiceEvent(title: "Clean Streets", attendees: ["Misha"], lengthInMinutes: 60, color: Color("Design"), date: Date()),
            ServiceEvent(title: "Sweep Courtyard", attendees: ["Sally"], lengthInMinutes: 30, color: Color("Web Dev"), date: Date())
        ]
    }
}

// below we are creating a template object, with empty attributes, before filling them with the functions above (I think). Swift is definitely a Type safe language.

extension ServiceEvent {
    struct Data {
        var title: String = ""
        var attendees: [String] = []
        var lengthInMinutes: Double = 5.0
        var color: Color = .random
        var date: Date = Date()
    }
    
    var data: Data {
        return Data(title: title, attendees: attendees, lengthInMinutes: Double(lengthInMinutes), color: color, date: date)
    }
    
    mutating func update(from data: Data) {
        title = data.title
        attendees = data.attendees
        lengthInMinutes = Int(data.lengthInMinutes)
        color = data.color
        date = data.date
    }
}

// the history object, which lets us see the previous times people have gone about

struct History: Identifiable, Codable {
    let id: UUID
    let date: Date
    var attendees: [String]
    var lengthInMinutes: Int
    var transcript: String?
    
//    @TODO: Do I need to add title as a var here?

    init(id: UUID = UUID(), date: Date = Date(), attendees: [String], lengthInMinutes: Int, transcript: String? = nil) {
        self.id = id
        self.date = date
        self.attendees = attendees
        self.lengthInMinutes = lengthInMinutes
        self.transcript = transcript
    }
}
