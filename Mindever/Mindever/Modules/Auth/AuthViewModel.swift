import SwiftUI
import Firebase

class AuthViewModel: ObservableObject {

    @Published var login: String = ""

    @Published var password: String = ""

    @Published var showActivityIndicator = false

    @Published var navigateToMainView = false

    func signIn() {
        self.showActivityIndicator = true

        Auth.auth().signIn(withEmail: login, password: password) { [weak self] result, error in
            guard let self = self else { return }
            self.showActivityIndicator = false

            if let userId = result?.user.uid {
                AuthManager.shared.setUserId(with: userId)
                self.navigateToMainView = true
            } else if let error = error as NSError? {
                switch AuthErrorCode(rawValue: error.code) {
                case .wrongPassword:
                    print("wrong password")
                case .invalidEmail:
                    print("invalid email")
                default:
                    print("Error: \(error.localizedDescription)")
                }
            }
        }
    }
}
