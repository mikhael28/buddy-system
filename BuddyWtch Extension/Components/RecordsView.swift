//
//  RecordsView.swift
//  BuddyWtch Extension
//
//  Created by Mikha'el on 6/20/21.
//

import Foundation
import SwiftUI
import struct Kingfisher.KFImage

struct RecordsView: View {
    @ObservedObject var recordManager = RecordFetcher()
    
    var body: some View {
        VStack {
            Text("Records")
            if (self.recordManager.fetchError == true) {
                Text("There was an error fetching your records")
                    .multilineTextAlignment(.center)
                Button(action: {
                    self.recordManager.fetchRecords()
                }){
                    Text("Try Again")
                }
            } else {
                List(self.recordManager.records) { record in
                    RecordRow(record: record)
                }
            }
        }.onAppear{
            self.recordManager.fetchRecords()
        }
    }

}

struct RecordRow: View {
    var record: Record

    var body: some View {
        VStack{
            Text("hey")
                .font(.caption)
                .fontWeight(.light)
                .lineLimit(2)
            Text(record.id)
                .font(.caption)
                .fontWeight(.light)
                .lineLimit(2)
        }.padding(.vertical)
    }
}

struct Record: Hashable, Identifiable {
    public var id: String
    public var gamePK: String
    public var gameSK: String
    public var course: String
    public var courseCode: String
    
    init(id: String, gamePK: String, gameSK: String, course: String, courseCode: String) {
        self.id = id
        self.gamePK = gamePK
        self.gameSK = gameSK
        self.course = course
        self.courseCode = courseCode
    }
    
}
