import Foundation

extension Localize {

    enum Navigation {
        case charts
        case download
        case date
        case selectDay

        var text: String {
            switch self {
            case .charts: return "navigation_charts".localize()
            case .download: return "navigation_doc".localize()
            case .date: return "navigation_date".localize()
            case .selectDay: return "navigation_selectDay".localize()
            }
        }
    }
}
