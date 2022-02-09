import SwiftUI

struct TabItemData {
    let image: String
    let title: String
}

enum TabType: Int, CaseIterable, Hashable {
    case mood = 0
    case thoughts = 1
    case beliefs = 2
    case settings = 3

    var tabItem: TabItemData {
        switch self {
        case .mood:
            return TabItemData(image: "face.smiling", title: Localize.Tab.mood.text)
        case .thoughts:
            return TabItemData(image: "brain.head.profile", title: Localize.Tab.thoughts.text)
        case .beliefs:
            return TabItemData(image: "bolt", title: Localize.Tab.beliefs.text)
        case .settings:
            return TabItemData(image: "gearshape", title: Localize.Tab.settings.text)
        }
    }
}
