import SwiftUI

struct StartView: View {

    @State var swinging = false

    var body: some View {
        NavigationView {
            VStack(alignment: .center) {
                Text(Localize.Base.mindever.text)
                    .font(.november(weight: .bold(size: 40)))
                    .foregroundColor(.black)

                Spacer()

                ZStack(alignment: .top) {
                    VStack {
                        Spacer()

                        let animation = Animation
                            .easeInOut(duration: 2)
                            .repeatForever(autoreverses: true)

                        Image("catonswing")
                            .scaleEffect(0.6)
                            .rotationEffect(.degrees(swinging ? -20 : 20), anchor: .top)
                            .onAppear {
                                DispatchQueue.main.async {
                                    withAnimation(animation) {
                                        swinging = true
                                    }
                                }
                            }
                    }

                    Image("cloud")
                        .scaleEffect(0.7)
                }
                .frame(height: 250)

                Spacer()

                VStack(spacing: 15) {
                    NavigationLink {
                        AuthView()
                    } label: {
                        ButtonView(title: Localize.Start.signIn.text, color: .violet)
                            .frame(height: 45)
                            .padding(.horizontal, 20)
                    }

                    NavigationLink {
                        RegistrationView()
                    } label: {
                        Text(Localize.Start.register.text)
                            .font(.november(weight: .medium(size: 16)))
                            .foregroundColor(.black)
                    }
                }
            }
            .padding(.vertical, 30)
            .background(.background)
            .navigationBarHidden(true)
        }
    }
}
