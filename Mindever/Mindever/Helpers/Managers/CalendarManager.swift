import Foundation

final class CalendarManager {

    static let shared = CalendarManager()

    private var calendar = Calendar.autoupdatingCurrent
    private let dateFormatter = DateFormatter()

    init() {
        self.calendar.timeZone = .current
    }

    func getWeek(
        byAdding value: Int = 0,
        for date: Date = Date(),
        records: Set<Date>
    ) -> [WeekDay] {
        let chosenDay = calendar.date(byAdding: .day, value: value, to: date)
        let resultDay = calendar.startOfDay(for: chosenDay ?? Date())

        var week: [WeekDay] = []
        if let weekInterval = calendar.dateInterval(of: .weekOfYear, for: resultDay) {
            for index in 0...6 {
                if let day = calendar.date(byAdding: .day, value: index, to: weekInterval.start) {
                    self.dateFormatter.dateFormat = "E"
                    let dayOfWeek = dateFormatter.string(from: day)

                    self.dateFormatter.dateFormat = "d"
                    let dateString = dateFormatter.string(from: day)

                    self.dateFormatter.dateFormat = "LLLL yyyy"
                    let monthAndYear = dateFormatter.string(from: day)

                    var hasRecords: Bool = false
                    for record in records {
                        if self.checkDayIsSameAs(pickedDate: record, date: day) {
                            hasRecords = true
                            break
                        }
                    }

                    week.append(WeekDay(dayOfWeek: dayOfWeek, day: dateString, monthAndYear: monthAndYear, date: day, hasRecords: hasRecords))
                }
            }
        }

        return week
    }

    func checkIsToday(date: Date) -> Bool {
        return calendar.isDateInToday(date)
    }

    func checkDayIsSameAs(pickedDate: Date, date: Date) -> Bool {
        return calendar.isDate(pickedDate, inSameDayAs: date)
    }

    func getDefaultSleep() -> Date {
        var components = DateComponents()
        components.hour = 8
        components.minute = 0
        let date = calendar.date(from: components)

        return date ?? Date.now
    }

    func firebaseStringToDate(with string: String) -> Date {
        dateFormatter.dateFormat = "dd.MM.yy"
        return dateFormatter.date(from: string) ?? Date()
    }

    func dateToFirebaseString(with date: Date) -> String {
        dateFormatter.dateFormat = "dd.MM.yy"
        return dateFormatter.string(from: date)
    }

}
