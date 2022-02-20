import Foundation

extension Localize {

    enum Action {
        case open
        case edit
        case delete
        case exitTitle
        case exit
        case saveTitle
        case save
        case cancel

        var text: String {
            switch self {
            case .open: return "action_open".localize()
            case .edit: return "action_edit".localize()
            case .delete: return "action_delete".localize()
            case .exitTitle: return "action_exitTitle".localize()
            case .exit: return "action_exit".localize()
            case .saveTitle: return "action_saveTitle".localize()
            case .save: return "action_save".localize()
            case .cancel: return "action_cancel".localize()
            }
        }
    }
}
