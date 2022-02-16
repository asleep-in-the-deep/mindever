import Foundation

extension Localize {

    enum Sleep {
        case sleep
        case duration(hours: String)
        case quality(value: Int)

        var text: String {
            switch self {
            case .sleep: return "mood_sleep".localize()
            case .duration(let hours): return "mood_sleepDuration".localize() + ": \(hours)"
            case .quality(let value): return "mood_sleepQuality".localize() + ": \(value)"
            }
        }
    }

    enum Emotion {
        case anxiety(value: Int)
        case annoyance(value: Int)
        case energy(value: Int)
        case selfEsteem(value: Int)

        var text: String {
            switch self {
            case .anxiety(let value): return "mood_anxiety".localize() + ": \(value)"
            case .annoyance(let value): return "mood_annoyance".localize() + ": \(value)"
            case .energy(let value): return "mood_energy".localize() + ": \(value)"
            case .selfEsteem(let value): return "mood_selfEsteem".localize() + ": \(value)"
            }
        }
    }

    enum Mood {
        case excited
        case happy
        case normal
        case sad
        case depressed

        var text: String {
            switch self {
            case .excited: return "mood_excited".localize()
            case .happy: return "mood_happy".localize()
            case .normal: return "mood_normal".localize()
            case .sad: return "mood_sad".localize()
            case .depressed: return "mood_depressed".localize()
            }
        }
    }

}
