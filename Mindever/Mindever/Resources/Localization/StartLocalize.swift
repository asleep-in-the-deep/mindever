import Foundation

extension Localize {

    enum Start {
        case signIn
        case register
        case auth
        case login
        case password
        case forgotPassword

        var text: String {
            switch self {
            case .signIn: return "start_signIn".localize()
            case .register: return "start_register".localize()
            case .auth: return "start_auth".localize()
            case .login: return "start_login".localize()
            case .password: return "start_password".localize()
            case .forgotPassword: return "start_forgotPassword".localize()
            }
        }
    }

    enum ForgotPassword {
        case title

        var text: String {
            switch self {
            case .title: return "forgotPassword_title".localize()
            }
        }
    }

    enum Registration {
        case title
        case name
        case repeatPassword
        case apply

        var text: String {
            switch self {
            case .title: return "reg_title".localize()
            case .name: return "reg_name".localize()
            case .repeatPassword: return "reg_repeatPassword".localize()
            case .apply: return "reg_apply".localize()
            }
        }
    }
}
