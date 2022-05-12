import SwiftUI

struct ButtonView: View {

    let title: String
    let color: Color

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .foregroundColor(color)

            Text(title)
                .font(.november(weight: .medium(size: 16)))
                .foregroundColor(.white)
        }
    }
}
