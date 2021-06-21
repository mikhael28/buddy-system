//
//  RecordFetcher.swift
//  BuddyWtch Extension
//
//  Created by Mikha'el on 6/20/21.
//

import Foundation
import SwiftUI
import Alamofire
import SwiftyJSON

public class RecordFetcher: ObservableObject {
    @Published var records: [Record] = []
    @Published var fetchError: Bool = false
    
    func fetchRecords() {
        self.fetchError = false
        AF.request("https://oti30m47rd.execute-api.us-east-1.amazonaws.com/dev/sp3/object/member/hGpVPl6z6N").responseJSON{ response in
            
            switch response.result {
            case .success(let value):
                print("Hello")
                let json = JSON(value)
                
                let records = json["records"].array ?? []
                var recordArray: [Record] = []
                for item in records {
                    let course = item["course"].string ?? "Unknown"
                    let gamePK = item["gamePK"].string ?? "Unknown"
                    let gameSK = item["gameSK"].string ?? "Unknown"
                    let courseCode = item["courseCode"].string ?? "Unknown"
                    let id = item["gamePK"].string ?? "Unknown"
                    
                    let recordItem = Record(id: id, gamePK: gamePK, gameSK: gameSK, course: course, courseCode: courseCode)
                    recordArray.append(recordItem)
                }
                print(recordArray)
                self.records = recordArray
                
//                print(json)
                
            case .failure(let error):
                print(error)
                self.fetchError = true
            }
        }
    }
}
