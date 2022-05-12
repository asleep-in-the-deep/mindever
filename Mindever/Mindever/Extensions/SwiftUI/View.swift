import SwiftUI
import SwiftUIX

extension View {

    // MARK: - Keyboard

    func endTextEditing() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder),
                                        to: nil, from: nil, for: nil)
    }

    // MARK: - Modifiers

    func showLoading(isActive: Bool) -> some View {
        overlay {
            Spacer()

            ActivityIndicator()
                .animated(isActive)
                .style(.large)
                .hidden(!isActive)

            Spacer()
        }
    }

}
