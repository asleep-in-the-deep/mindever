import Foundation
import Combine

class MoodViewModel: ObservableObject {

    @Published var selectedDay: WeekDay?

    @Published var recordDates: Set<Date> = []

    @Published var daySleep: SleepRecord?
    private var sleepRecords: [SleepRecord] = []

    @Published var dayMoods: [MoodRecord] = []
    private var moodRecords: [MoodRecord] = []

    @Published var showActivityIndicator = false

    private var cancellables = Set<AnyCancellable>()

    init() {
        $selectedDay.sink { [weak self] day in
            self?.setDay(selectedDay: day)
        }
        .store(in: &cancellables)
    }

    func getData() {
        self.showActivityIndicator = true

        MoodManager.getSleep { result in
            switch result {
            case .success(let sleepRecords):
                self.sleepRecords = sleepRecords

                MoodManager.getMoods { result in
                    self.showActivityIndicator = false
                    switch result {
                    case .success(let moodRecords):
                        self.moodRecords = moodRecords
                        self.setRecords()
                        self.setDay(selectedDay: self.selectedDay)
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                }
            case .failure(let error):
                self.showActivityIndicator = false
                print(error.localizedDescription)
            }
        }
    }

    private func setRecords() {
        for moodRecord in moodRecords {
            let date = CalendarManager.shared.firebaseStringToDate(with: moodRecord.date)
            recordDates.insert(date)
        }
    }

    private func setDay(selectedDay: WeekDay?) {
        guard let date = selectedDay?.date else { return }

        daySleep = nil
        dayMoods.removeAll()

        for sleepRecord in sleepRecords {
            let sleepDate = CalendarManager.shared.firebaseStringToDate(with: sleepRecord.date)

            if CalendarManager.shared.checkDayIsSameAs(pickedDate: date, date: sleepDate) {
                self.daySleep = sleepRecord
            }
        }

        for moodRecord in moodRecords {
            let moodDate = CalendarManager.shared.firebaseStringToDate(with: moodRecord.date)

            if CalendarManager.shared.checkDayIsSameAs(pickedDate: date, date: moodDate) {
                self.dayMoods.append(moodRecord)
            }
        }

        self.dayMoods = self.dayMoods.sorted(by: { $0.time > $1.time })
    }

    // MARK: - Actions

    func deleteMood(with id: String?) {
        print(id)
    }
}
