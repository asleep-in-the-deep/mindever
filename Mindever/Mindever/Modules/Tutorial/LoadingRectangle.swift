import SwiftUI

struct LoadingRectangle: View {

    var progress: CGFloat

    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 5)
                    .foregroundColor(.white.opacity(0.3))

                RoundedRectangle(cornerRadius: 5)
                    .frame(width: geometry.size.width * self.progress, alignment: .leading)
                    .foregroundColor(.white.opacity(0.9))
            }
        }
    }
}
