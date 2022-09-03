import Foundation

extension Localize {

    enum Situation {
        case title
        case placeholder

        var text: String {
            switch self {
            case .title: return "cbt_situation_title".localize()
            case .placeholder: return "cbt_situation_placeholder".localize()
            }
        }
    }

    enum Distortions {
        case title
        case allOrNothing
        case overgeneralization
        case negativeFilter
        case positiveMinimization
        case quicklyConclusions
        case exaggerationOrUnterstatement
        case necessity
        case labeling
        case personalization

        var text: String {
            switch self {
            case .title: return "cbt_distortions_title".localize()
            case .allOrNothing: return "cbt_distortions_allornothing".localize()
            case .overgeneralization: return "cbt_distortions_overgeneralization".localize()
            case .negativeFilter: return "cbt_distortions_negativefilter".localize()
            case .positiveMinimization: return "cbt_distortions_positiveminimization".localize()
            case .quicklyConclusions: return "cbt_distortions_quicklyconclusions".localize()
            case .exaggerationOrUnterstatement: return "cbt_distortions_exaggerationorunderstatement".localize()
            case .necessity: return "cbt_distortions_must".localize()
            case .labeling: return "cbt_distortions_label".localize()
            case .personalization: return "cbt_distortions_personalization".localize()
            }
        }
    }
}
