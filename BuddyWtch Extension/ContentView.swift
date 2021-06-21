//
//  ContentView.swift
//  BuddyWtch Extension
//
//  Created by Mikha'el on 6/19/21.
//

import SwiftUI
import Alamofire
import SwiftyJSON

struct ContentView: View {
    @Binding var events: [ServiceEvent]
    @Environment(\.scenePhase) private var scenePhase
    @State private var isPresented = false
    @State private var newEventData = ServiceEvent.Data()
    @State private var currentPage = 0
    @State var records: [GameRecord] = []
    let saveAction: () -> Void
            
    var body: some View {
        
        VStack {
               PagerManager(pageCount: 2, currentIndex: $currentPage) {
                List {
                    ForEach(events) { event in
                        NavigationLink(destination: DetailView(event: binding(for: event))) {
                            CardView(event: event)
                            }
                        }
                    }
                // each element associated with a page
                VStack(alignment: .trailing){
                            Text("Profile")
                                .font(.title)
                                .fontWeight(.thin)
                            
//                            Text("Daily news, delivered on your wrist.")
//                                .fontWeight(.thin)
//                                .multilineTextAlignment(.trailing)
                            
                            Spacer()
                            
                            NavigationLink(destination: RecordsView()){
                                Text("View Records")
                            }
                        }
           }
               
               Spacer()
               
               //Page Control
               HStack{
                   Circle()
                       .frame(width: 8, height: 8)
                       .foregroundColor(currentPage==1 ? Color.gray:Color.white)
                   Circle()
                       .frame(width: 8, height: 8)
                       .foregroundColor(currentPage==1 ? Color.white:Color.gray)
               }
           }
        
        }
    private func binding(for event: ServiceEvent) -> Binding<ServiceEvent> {
        guard let eventIndex = events.firstIndex(where: { $0.id == event.id }) else {
            fatalError("Can't find scrum in array")
        }
        return $events[eventIndex]
    }
    }
