/*
See LICENSE folder for this sample’s licensing information.
*/

import Foundation

class EventData: ObservableObject {
    private static var documentsFolder: URL {
        do {
            return try FileManager.default.url(for: .documentDirectory,
                                               in: .userDomainMask,
                                               appropriateFor: nil,
                                               create: false)
        } catch {
            fatalError("Can't find documents directory.")
        }
    }
    private static var fileURL: URL {
        return documentsFolder.appendingPathComponent("events.data")
    }
    @Published var events: [ServiceEvent] = []

    func load() {
        DispatchQueue.global(qos: .background).async { [weak self] in
            guard let data = try? Data(contentsOf: Self.fileURL) else {
                #if DEBUG
                DispatchQueue.main.async {
                    self?.events = ServiceEvent.data
                }
                #endif
                return
            }
            guard let dailyEvents = try? JSONDecoder().decode([ServiceEvent].self, from: data) else {
                fatalError("Can't decode saved scrum data.")
            }
            DispatchQueue.main.async {
                self?.events = dailyEvents
            }
        }
    }
    func save() {
        DispatchQueue.global(qos: .background).async { [weak self] in
            guard let events = self?.events else { fatalError("Self out of scope") }
            guard let data = try? JSONEncoder().encode(events) else { fatalError("Error encoding data") }
            do {
                let outfile = Self.fileURL
                try data.write(to: outfile)
            } catch {
                fatalError("Can't write to file")
            }
        }
    }
}
