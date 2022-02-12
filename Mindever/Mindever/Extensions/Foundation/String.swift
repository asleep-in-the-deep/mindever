import Foundation

extension String {

    func localize() -> String {
        NSLocalizedString(self, comment: "")
    }

    func capitalizeInSentence() -> String {
        prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}
