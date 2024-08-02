/*
 Citation: Stewart Lynch
 Youtube: https://youtu.be/d8KYAeBDQAQ?si=fuXGUp6bVyB6dSJJ
 Github: https://github.com/StewartLynch/UICalendarView_SwiftUI-Completed
 */
import Foundation
extension Date {
    func diff(numDays: Int) -> Date {
        Calendar.current.date(byAdding: .day, value: numDays, to: self)!
    }
    
    var startOfDay: Date {
        Calendar.current.startOfDay(for: self)
    }
}
