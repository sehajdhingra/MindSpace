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
            VStack(spacing: 0) {
                // Custom title view
                Text("Calendar")
                    .fontWeight(.bold)
                    .foregroundColor(Color(hex: "573353"))
                    .font(.custom("Klasik Regular", size: 35))
                    .padding()
                
                // Calendar view in a ScrollView
                ScrollView {
                    CalendarView(range: DateInterval(start: .distantPast, end: .distantFuture),
                                 eventStore: eventStore,
                                 dateSelected: $dateSelected,
                                 displayEvents: $displayEvents)
                }
                
                // Bottom image
                Image("Habits")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 170)
                    .offset(y: 10)
                    .padding()
            }
            .background(Color(hex: "FFF3E9"))
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        formType = .new
                    } label: {
                        Image("Vector (1)")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 25, height: 25)
                            .offset(y: 5)
                            .offset(x: -5)
                    }
                }
            }
            .sheet(item: $formType) { $0 }
            .sheet(isPresented: $displayEvents) {
                DaysEventsListView(dateSelected: $dateSelected)
                    .presentationDetents([.medium, .large])
            }
        }
    }
}

struct CalendarScreen_Previews: PreviewProvider {
    static var previews: some View {
        CalendarScreen()
            .environmentObject(EventStore(preview: true))
    }
}
