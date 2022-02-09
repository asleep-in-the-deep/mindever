import SwiftUI

class MainViewModel: ObservableObject {

    @Published var selected = TabType.mood

    let tabs: [TabType] = [
        TabType.mood,
        TabType.thoughts,
        TabType.beliefs,
        TabType.settings
    ]
}
