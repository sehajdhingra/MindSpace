/*
 Citation: Stewart Lynch
 Youtube: https://youtu.be/d8KYAeBDQAQ?si=fuXGUp6bVyB6dSJJ
 Github: https://github.com/StewartLynch/UICalendarView_SwiftUI-Completed
 */
import SwiftUI
struct CalendarView: UIViewRepresentable {
    let range:DateInterval
    @ObservedObject var eventStore: EventStore
    @Binding var dateSelected: DateComponents?
    @Binding var displayEvents: Bool
    
    func makeUIView(context: Context) -> UICalendarView {
        let view=UICalendarView()
        view.delegate=context.coordinator
        view.calendar=Calendar(identifier:.gregorian)
        view.availableDateRange=range
        let dateSelection=UICalendarSelectionSingleDate(delegate: context.coordinator)
        view.selectionBehavior=dateSelection
        return view
        
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self, eventStore: _eventStore)
    }
    
    func updateUIView(_ uiView: UICalendarView, context: Context) {
        if let changed = eventStore.changedEvent {
            uiView.reloadDecorations(forDateComponents: [changed.dateComponents], animated: true)
            eventStore.changedEvent = nil
        }
        if let moved = eventStore.movedEvent {
            uiView.reloadDecorations(forDateComponents: [moved.dateComponents], animated: true)
            eventStore.movedEvent = nil
        }
    }
    
    class Coordinator: NSObject, UICalendarViewDelegate, UICalendarSelectionSingleDateDelegate{
        var parent: CalendarView
        @ObservedObject var eventStore: EventStore
        init(parent: CalendarView, eventStore: ObservedObject<EventStore>) {
            self.parent = parent
            self._eventStore = eventStore
        }
        
        @MainActor
        func calendarView(_ calendarView: UICalendarView,decorationFor dateComponents:DateComponents) -> UICalendarView.Decoration? {
            let found=eventStore.events.filter{$0.date.startOfDay==dateComponents.date?.startOfDay}
            
            if(found.isEmpty){
                return nil
            }
            
            if(found.count>1){
                return .image(UIImage(systemName:"doc.on.doc.fill"),color:.red,size:.large)
            }
            
            let single=found.first!
            
            return .customView {
                    let icon = UILabel()
                    icon.text = single.eventType.icon
                    return icon
            }
        }
        
        func dateSelection(_ selection: UICalendarSelectionSingleDate, didSelectDate dateComponents: DateComponents?) {
            parent.dateSelected=dateComponents
            guard let dateComponents else{
                return
            }
            
            let found=eventStore.events.filter{$0.date.startOfDay==dateComponents.date?.startOfDay}
            if (!found.isEmpty){
                parent.displayEvents.toggle()
            }
        }
        
        func dateSelection(_ selection: UICalendarSelectionSingleDate, canSelectDate dateComponents: DateComponents?) -> Bool {
            return true
        }
    }
    
}
