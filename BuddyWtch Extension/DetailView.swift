import SwiftUI

struct DetailView: View {
    @Binding var event: ServiceEvent
    @State private var data: ServiceEvent.Data = ServiceEvent.Data()
    @State private var isPresented = false
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
    }
}
