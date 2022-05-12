import SwiftUI

class NewMoodViewModel: ObservableObject {

    @Published var mood: Int = 3
    @Published var energy: Int = 3
    @Published var selfEsteem: Int = 3
    @Published var anxiety: Int = 0
    @Published var annoyance: Int = 0

    @Published var sleepTime: Date = CalendarManager.shared.getDefaultSleep()
    @Published var sleepQuality = 3

    @Published var showActivityIndicator = false
    @Published var showAlert = false
    @Published var hideView = false

    func saveMood(withSleep: Bool) {
        guard let userId = AuthManager.shared.getUserId()
        else {
            self.showAlert = true
            return
        }

        let currentDate = CalendarManager.shared.getDateForFirebase()
        let currentTime = CalendarManager.shared.getTimeForFirebase()
        let sleepDuration = CalendarManager.shared.getTimeForFirebase(with: self.sleepTime)

        let mood = MoodRecord(user: userId,
                              date: currentDate,
                              time: currentTime,
                              mood: self.mood,
                              energy: self.energy,
                              selfEsteem: self.selfEsteem,
                              anxiety: self.anxiety,
                              annoyance: self.annoyance
        )

        let sleep = SleepRecord(user: userId,
                                date: currentDate,
                                duration: sleepDuration,
                                quality: self.sleepQuality
        )

        self.showActivityIndicator = true
        print(mood)

        MoodManager.addMood(with: mood) { result in
            switch result {
            case .success:
                if withSleep {
                    self.addSleep(with: sleep)
                } else {
                    self.showActivityIndicator = false
                    self.hideView = true
                }
            case .failure(let error):
                print(error.localizedDescription)
                self.showActivityIndicator = false
                self.showAlert = true
            }
        }
    }

    private func addSleep(with sleep: SleepRecord) {
        MoodManager.addSleep(with: sleep) { result in
            self.showActivityIndicator = false

            switch result {
            case .success:
                self.hideView = true
            case .failure(let error):
                print(error.localizedDescription)
                self.showAlert = true
            }
        }
    }
}
