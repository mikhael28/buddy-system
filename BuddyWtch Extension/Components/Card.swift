import SwiftUI

// this is the view, the render for the card component

struct CardView: View {
    let event: ServiceEvent
    var body: some View {
        VStack(alignment: .leading) {
            Text(event.title)
                .font(.headline)
            Spacer()
            HStack {
                Label("\(event.attendees.count)", systemImage: "person.3")
                    .padding(.leading, 10)
                    .accessibilityElement(children: .ignore)
                    .accessibilityLabel(Text("Attendees"))
                    .accessibilityValue(Text("\(event.attendees.count)"))
                Spacer()
                Label("\(event.lengthInMinutes)m", systemImage: "clock")
                    .padding(.leading, 20)
                    .accessibilityElement(children: .ignore)
                    .accessibilityLabel(Text("Event Length"))
                    .accessibilityValue(Text("\(event.lengthInMinutes) minutes"))
            }
            .font(.caption)
        }
        .padding(.leading)
        // foreground color is font color
        .foregroundColor(event.color)
    }
}
