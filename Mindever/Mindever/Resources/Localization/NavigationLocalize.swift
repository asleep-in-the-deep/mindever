import Foundation

extension Localize {

    enum Navigation {
        case charts
        case download
        case date
        case selectDay
        case cancel
        case save
        case newRecord

        var text: String {
            switch self {
            case .charts: return "navigation_charts".localize()
            case .download: return "navigation_doc".localize()
            case .date: return "navigation_date".localize()
            case .selectDay: return "navigation_selectDay".localize()
            case .cancel: return "navigation_cancel".localize()
            case .save: return "navigation_save".localize()
            case .newRecord: return "navigation_newRecord".localize()
            }
        }
    }
}
