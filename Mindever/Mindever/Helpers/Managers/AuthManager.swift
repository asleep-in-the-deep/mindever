import Foundation

final class AuthManager {

    static let shared = AuthManager()

    private enum Keys {
        static let userId = "userId"
    }

    // MARK: - User ID

    func setUserId(with userId: String) {
        UserDefaults.standard.set(userId, forKey: Keys.userId)
    }

    func getUserId() -> String? {
        UserDefaults.standard.string(forKey: Keys.userId)
    }

    func removeUserId() {
        UserDefaults.standard.removeObject(forKey: Keys.userId)
    }
}
