/*
 Citation: Stewart Lynch
 Youtube: https://youtu.be/d8KYAeBDQAQ?si=fuXGUp6bVyB6dSJJ
 Github: https://github.com/StewartLynch/UICalendarView_SwiftUI-Completed
 */
import Foundation
struct Event: Identifiable {
    enum EventType: String, Identifiable, CaseIterable {
        case work, home, social, sport, unspecified
        var id: String {
            self.rawValue
        }
        var icon: String {
            switch self {
            case .work:
                return "🏦"
            case .home:
                return "🏡"
            case .social:
                return "🎉"
            case .sport:
                return "🏟"
            case .unspecified:
                return "📌"
            }
        }
    }
    var eventType: EventType
    var date: Date
    var note: String
    var id: String
    
    var dateComponents: DateComponents {
        var dateComponents = Calendar.current.dateComponents(
            [.month,
             .day,
             .year,
             .hour,
             .minute],
            from: date)
        dateComponents.timeZone = TimeZone.current
        dateComponents.calendar = Calendar(identifier: .gregorian)
        return dateComponents
    }
    init(id: String = UUID().uuidString, eventType: EventType = .unspecified, date: Date, note: String) {
        self.eventType = eventType
        self.date = date
        self.note = note
        self.id = id
    }
    static var sampleEvents: [Event] {
        return [
            Event(eventType: .home, date: Date().diff(numDays: 0), note: "Walk dog"),
            Event(date: Date().diff(numDays: -1), note: "Get groceries"),
            Event(eventType: .home, date: Date().diff(numDays: 6), note: "House cleaning."),
            Event(eventType: .social, date: Date().diff(numDays: 2), note: "Hangout at Cafe"),
            Event(eventType: .work, date: Date().diff(numDays: -1), note: "Work shift"),
            Event(eventType: .sport, date: Date().diff(numDays: -3), note: "Football game"),
            Event(date: Date().diff(numDays: -4), note: "Organize computer files.")
        ]
    }
}
