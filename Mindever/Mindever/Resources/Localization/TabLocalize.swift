import Foundation

extension Localize {

    enum Tab {
        case mood
        case thoughts
        case beliefs
        case settings

        var text: String {
            switch self {
            case .mood: return "tab_mood".localize()
            case .thoughts: return "tab_thoughts".localize()
            case .beliefs: return "tab_beliefs".localize()
            case .settings: return "tab_settings".localize()
            }
        }
    }
}
