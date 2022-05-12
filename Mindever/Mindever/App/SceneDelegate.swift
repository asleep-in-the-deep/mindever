import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        let startView = MainView()

        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = UIHostingController(rootView: startView)
            self.window = window
            window.makeKeyAndVisible()
        }

        UIView.appearance(whenContainedInInstancesOf: [UIAlertController.self]).tintColor = Color.violet.toUIColor()
    }

}

