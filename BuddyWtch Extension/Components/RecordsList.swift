//
//  RecordsList.swift
//  BuddyWtch Extension
//
//  Created by Mikha'el on 6/20/21.
//

import Foundation
import SwiftUI
import struct Kingfisher.KFImage

struct RecordsRow: View {

    var record: Record
    var body: some View {
        VStack{
            KFImage(URL(string: "https://assets.vogue.com/photos/5eb0a75cd5f359c964b7e0e4/16:9/w_1280,c_limit/"))
                .placeholder {
                            Image(systemName: "arrow.2.circlepath.circle")
                               .font(.largeTitle)
                               .opacity(0.3)
                         }
                .resizable()
                .scaledToFill()
                .frame(width: 50, height: 50)
                .cornerRadius(3.0)
            Text("Willows Run")
                .font(.caption)
                .fontWeight(.light)
                .lineLimit(2)
        }.padding(.vertical)
    }
}

struct Record: Hashable, Identifiable {
    public var id: String
    public var PK: String
    public var SK: String
    public var LSI1: String
    public var course: String
    public var time: String
    public var imageLink: String
    
    init(id: String, PK: String, SK: String, LSI1: String, course: String, time: String, imageLink: String) {
        self.id = UUID().uuidString
        self.PK = PK
        self.SK = SK
        self.LSI1 = LSI1
        self.course = course
        self.time = time
        self.imageLink = imageLink
    }
    
}
