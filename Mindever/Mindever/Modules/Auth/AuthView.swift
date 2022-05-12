import SwiftUI
import SwiftUIX

struct AuthView: View {

    @StateObject private var viewModel = AuthViewModel()

    var body: some View {
        ZStack {
            Color.background.edgesIgnoringSafeArea(.all)
                .onTapGesture {
                    self.endTextEditing()
                }

            VStack(spacing: 60) {
                Text(Localize.Start.auth.text)
                    .font(.november(weight: .bold(size: 25)))
                    .foregroundColor(.black)
                    .padding(.bottom, 30)

                VStack(spacing: 25) {
                    TextField(Localize.Start.login.text, text: $viewModel.login)
                        .frame(height: 45)
                        .padding(.horizontal, 10)
                        .overlay(RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.border, lineWidth: 1)
                        )

                    SecureField(Localize.Start.password.text, text: $viewModel.password)
                        .frame(height: 45)
                        .padding(.horizontal, 10)
                        .overlay(RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.border, lineWidth: 1)
                        )

                    NavigationLink {
                        ForgotPasswordView()
                    } label: {
                        Text(Localize.Start.forgotPassword.text)
                            .font(.november(weight: .medium(size: 16)))
                            .foregroundColor(.black)
                    }
                }

                Button(action: viewModel.signIn) {
                    ButtonView(title: Localize.Start.signIn.text, color: .violet)
                        .frame(height: 45)
                }

                Spacer()
            }
            .padding(.horizontal, 20)
        }
        .blur(radius: viewModel.showActivityIndicator ? 50 : 0)
        .disabled(viewModel.showActivityIndicator)
        .showLoading(isActive: viewModel.showActivityIndicator)
        .navigate(to: MainView(), isActive: $viewModel.navigateToMainView)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: NaviigationBarBackButtonView())
    }
}


