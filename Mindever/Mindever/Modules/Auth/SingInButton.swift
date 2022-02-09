import SwiftUI
import AuthenticationServices

struct SingInButton: UIViewRepresentable {
    typealias UIViewType = ASAuthorizationAppleIDButton


    func makeUIView(context: Context) -> ASAuthorizationAppleIDButton {
        return ASAuthorizationAppleIDButton()
    }

    func updateUIView(_ uiView: ASAuthorizationAppleIDButton, context: Context) {
    }
}
