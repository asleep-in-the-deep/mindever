import SwiftUI

struct AuthView: View {

    @State var swinging = false

    var body: some View {
        VStack(alignment: .center) {
            Text("Mindever")
                .font(.november(weight: .bold(size: 40)))
                .foregroundColor(.black)
                .padding(.bottom, 30)

            Spacer()

            ZStack(alignment: .top) {
                VStack {
                    Spacer()

                    Image("catonswing-2")
                        .scaleEffect(0.6)
                        .rotationEffect(.degrees(swinging ? -20 : 20), anchor: .top)
                        .animation(.easeInOut(duration: 2).repeatForever(), value: swinging)
                        .task {
                            swinging.toggle()
                        }
                }

                Image("cloud")
                    .scaleEffect(0.7)
            }
            .frame(height: 250)

            Spacer()

            SingInButton()
                .frame(height: 45)
                .padding(.horizontal, 20)
        }
        .padding(.vertical, 30)
        .background(.background)
    }
}
