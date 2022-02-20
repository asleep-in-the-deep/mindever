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
        case depressed
        case sad
        case normal
        case happy
        case excited

        var text: String {
            switch self {
            case .depressed: return "mood_depressed".localize()
            case .sad: return "mood_sad".localize()
            case .normal: return "mood_normal".localize()
            case .happy: return "mood_happy".localize()
            case .excited: return "mood_excited".localize()
            }
        }
    }

    enum MoodRecord {
        case mood
        case energy
        case selfEsteem
        case anxiety
        case annoyance
        case sleepDuration
        case sleepQuality

        var text: String {
            switch self {
            case .mood: return "moodRecord_selectMood".localize()
            case .energy: return "moodRecord_selectEnergy".localize()
            case .selfEsteem: return "moodRecord_selectSelfesteem".localize()
            case .anxiety: return "moodRecord_selectAnxiety".localize()
            case .annoyance: return "moodRecord_selectAnnoyance".localize()
            case .sleepDuration: return "moodRecord_selectSleep".localize()
            case .sleepQuality: return "moodRecord_selectQuality".localize()
            }
        }
    }

}
