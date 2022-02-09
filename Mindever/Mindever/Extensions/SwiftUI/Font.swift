import SwiftUI

extension Font {

    enum NovemberWeight {
        case light(size: CGFloat)
        case regular(size: CGFloat)
        case medium(size: CGFloat)
        case bold(size: CGFloat)
    }

    static func november(weight: NovemberWeight) -> Font {
        switch weight {
        case .light(let size):
            return Font.custom("NovemberLCG-Light", size: size)
        case .regular(let size):
            return Font.custom("NovemberLCG-Regular", size: size)
        case .medium(let size):
            return Font.custom("NovemberLCG-Medium", size: size)
        case .bold(let size):
            return Font.custom("NovemberLCG-Bold", size: size)
        }
    }
}
