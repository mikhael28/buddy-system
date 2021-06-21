//
//  RecordsList.swift
//  BuddyWtch Extension
//
//  Created by Mikha'el on 6/20/21.
//

import Foundation
import SwiftUI
import struct Kingfisher.KFImage

import Alamofire
import SwiftyJSON

public class ProfileFetcher: ObservableObject {
    @Published var records: [GameRecord] = []
    @Published var fetchError: Bool = false
    
    func fetchRecords() {
        AF.request("https://oti30m47rd.execute-api.us-east-1.amazonaws.com/dev/sp3/object/member/hGpVPl6z6N").responseJSON{ response in

            switch response.result {
            case .success(let value):
                print("Hello")
                let json = JSON(value)
                
                print(json)
                
            case .failure(let error):
                print(error)
                self.fetchError = true
            }
        }
    }
}

struct ProfileView: View {

//    var profile: Profile
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
            Text("Name Here")
                .font(.caption)
                .fontWeight(.light)
                .lineLimit(2)
        }.padding(.vertical)
    }
}

struct Profile {
//    public var id: String
    public var PK: String
    public var profilePicture: String
//    public var SK: String
//    public var LSI1: String
//    public var bio: String
    public var fName: String
    public var lName: String
    public var xp: Int
//    public var access_token: String
    public var records: [GameRecord]
    
    init(id: String, PK: String, SK: String, LSI1: String, fName: String, lName: String, profilePicture: String, access_token: String, xp: Int, records: [GameRecord]) {
//        self.id = UUID().uuidString
        self.PK = PK
//        self.SK = SK
//        self.LSI1 = LSI1
        self.lName = lName
        self.fName = fName
        self.profilePicture = profilePicture
//        self.bio = bio
//        self.access_token = access_token
        self.xp = xp
        self.records = records
    }
    
}

struct GameRecord {
    public var gamePK: String
    public var course: String
    public var courseCode: String
    public var gameSK: String
    
    init(gamePK: String, course: String, courseCode: String, gameSK: String) {
        self.gamePK = gamePK
        self.course = course
        self.courseCode = courseCode
        self.gameSK = gameSK
    }
}
