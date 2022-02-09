import SwiftUI
import Combine

class TutorialTimer: ObservableObject {

    @Published var progress: Double

    private var publisher: Timer.TimerPublisher
    private var cancellable: Cancellable?

    init() {
        self.progress = 0
        self.publisher = Timer.publish(every: 0.1, on: .main, in: .default)
    }

    func start(count: Int, interval: TimeInterval) {
        self.cancellable = self.publisher.autoconnect().sink(receiveValue: {  _ in
            var newProgress = self.progress + (0.1 / interval)

            if Int(newProgress) >= count {
                newProgress = Double(count) - 0.01
                self.cancel()
            }

            self.progress = newProgress
        })
    }

    func cancel() {
        self.cancellable?.cancel()
    }

    func advance(by number: Int, count: Int) {
        let newProgress = max((Int(self.progress) + number) % count, 0)
        self.progress = Double(newProgress)
    }
}
