import Foundation

extension Localize {

    enum Base {
        case noRecords

        var text: String {
            switch self {
            case .noRecords: return "base_norecords".localize()
            }
        }
    }
}
