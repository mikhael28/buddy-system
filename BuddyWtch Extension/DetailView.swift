import SwiftUI

struct DetailView: View {
    @Binding var event: ServiceEvent
    @State private var data: ServiceEvent.Data = ServiceEvent.Data()
    @State private var isPresented = false
    @State var currentDate = Date()
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var body: some View {
        List {
            Section(header: Text("Attendees")) {
                ForEach(event.attendees, id: \.self) { attendee in
                    Label(attendee, systemImage: "person")
                        .accessibilityLabel(Text("Person"))
                        .accessibilityValue(Text(attendee))
                }
            }
        }
        .navigationTitle(event.title)
        Spacer()
        // below is how conditional rendering works, Group is like a Div
                Group {
                    if isPresented == true {
                        Text("\(currentDate)")
                            .onReceive(timer) { input in
                                currentDate = input
                            }
                    }
                }
            
        Spacer()
        Button("Join Party") {
            isPresented = true
        }
    }
}

