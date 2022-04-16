import SwiftUI

struct MoodRecord: Codable, Hashable {
    let date: String
    let time: String
    let mood: Int
    let energy: Int
    let selfEsteem: Int
    let anxiety: Int
    let annoyance: Int
}

struct SleepRecord: Codable {
    let date: String
    let duration: String
    let quality: Int
}

enum Mood: Int {
    case depressed = 1
    case sad
    case normal
    case happy
    case excited

    var icon: Image {
        switch self {
        case .depressed: return Image.depressed
        case .sad: return Image.sad
        case .normal: return Image.normal
        case .happy: return Image.happy
        case .excited: return Image.excited
        }
    }

    var name: String {
        switch self {
        case .depressed: return Localize.Mood.depressed.text
        case .sad: return Localize.Mood.sad.text
        case .normal: return Localize.Mood.normal.text
        case .happy: return Localize.Mood.happy.text
        case .excited: return Localize.Mood.excited.text
        }
    }
}
