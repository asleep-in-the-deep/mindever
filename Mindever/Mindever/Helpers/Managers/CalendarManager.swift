import Foundation

final class CalendarManager {

    static let shared = CalendarManager()

    private var calendar = Calendar.autoupdatingCurrent
    private let dateFormatter = DateFormatter()

    init() {
        self.calendar.timeZone = .current
    }

    func getWeek(byAdding value: Int = 0, for date: Date = Date()) -> [WeekDays] {
        let chosenDay = calendar.date(byAdding: .day, value: value, to: date)
        let resultDay = calendar.startOfDay(for: chosenDay ?? Date())

        var week: [WeekDays] = []
        if let weekInterval = calendar.dateInterval(of: .weekOfYear, for: resultDay) {
            for index in 0...6 {
                if let day = calendar.date(byAdding: .day, value: index, to: weekInterval.start) {
                    self.dateFormatter.dateFormat = "E"
                    let dayOfWeek = dateFormatter.string(from: day)

                    self.dateFormatter.dateFormat = "d"
                    let dateString = dateFormatter.string(from: day)

                    self.dateFormatter.dateFormat = "MMMM yyyy"
                    let monthAndYear = dateFormatter.string(from: day)

                    week.append(WeekDays(dayOfWeek: dayOfWeek, day: dateString, monthAndYear: monthAndYear, date: day, hasRecords: false))
                }
            }
        }

        return week
    }

    func checkIsToday(date: Date) -> Bool {
        if calendar.isDateInToday(date) {
            return true
        } else {
            return false
        }
    }

}
