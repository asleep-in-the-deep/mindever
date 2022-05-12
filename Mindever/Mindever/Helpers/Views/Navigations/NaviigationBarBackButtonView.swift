import SwiftUI

struct NaviigationBarBackButtonView: View {

    @Environment(\.dismiss) private var dismiss

    var body: some View {
        Button(action: {
            self.dismiss()
        }) {
            Image(systemName: "chevron.left")
                .foregroundColor(.black)
                .font(.system(size: 16, weight: .semibold))
        }
    }
}
