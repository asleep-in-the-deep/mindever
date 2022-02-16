import Foundation

extension Localize {

    enum Action {
        case open
        case edit
        case delete

        var text: String {
            switch self {
            case .open: return "action_open".localize()
            case .edit: return "action_edit".localize()
            case .delete: return "action_delete".localize()
            }
        }
    }
}
