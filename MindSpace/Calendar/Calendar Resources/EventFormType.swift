/*
 Citation: Stewart Lynch
 Youtube: https://youtu.be/d8KYAeBDQAQ?si=fuXGUp6bVyB6dSJJ
 Github: https://github.com/StewartLynch/UICalendarView_SwiftUI-Completed
 */
import SwiftUI
enum EventFormType: Identifiable, View {
    case new
    case update(Event)
    var id: String {
        switch self {
        case .new:
            return "new"
        case .update:
            return "update"
        }
    }
    var body: some View {
        switch self {
        case .new:
            return EventFormView(viewModel: EventFormViewModel())
        case .update(let event):
            return EventFormView(viewModel: EventFormViewModel(event))
        }
    }
}
