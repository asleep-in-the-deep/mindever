import Foundation

extension Localize {

    enum Base {
        case mindever
        case noRecords
        case submit
        case alert

        var text: String {
            switch self {
            case .mindever: return "base_mindever".localize()
            case .noRecords: return "base_norecords".localize()
            case .submit: return "base_submit".localize()
            case .alert: return "base_alert".localize()
            }
        }
    }
}
