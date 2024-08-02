/*
 Citation: Stewart Lynch
 Youtube: https://youtu.be/d8KYAeBDQAQ?si=fuXGUp6bVyB6dSJJ
 Github: https://github.com/StewartLynch/UICalendarView_SwiftUI-Completed
 */
import SwiftUI
struct CalendarScreen: View {
    @EnvironmentObject var eventStore: EventStore
       @State private var dateSelected: DateComponents?
       @State private var displayEvents = false
       @State private var formType: EventFormType?
       
       var body: some View {
           NavigationStack {
               ScrollView {
                   CalendarView(range: DateInterval(start: .distantPast, end: .distantFuture),
                                eventStore: eventStore,
                                dateSelected: $dateSelected,
                                displayEvents: $displayEvents)
              
               }
               .toolbar {
                   ToolbarItem(placement: .navigationBarTrailing) {
                       Button {
                           formType = .new
                       } label: {
                           Image(systemName: "plus.circle.fill")
                               .imageScale(.medium)
                       }
                   }
               }
               .sheet(item: $formType) { $0 }
               .sheet(isPresented: $displayEvents) {
                   DaysEventsListView(dateSelected: $dateSelected)
                       .presentationDetents([.medium, .large])
               }
               
                   .navigationTitle("Calendar")
           }
       }
   }
   struct CalendarScreen_Previews: PreviewProvider {
       static var previews: some View {
           CalendarScreen()
               .environmentObject(EventStore(preview: true))
       }
   }
