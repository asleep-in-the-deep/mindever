import SwiftUI

struct RegistrationView: View {

    @State var name: String = ""
    @State var login: String = ""
    @State var password: String = ""
    @State var repeatPassword: String = ""

    var body: some View {
        ZStack {
            Color.background.edgesIgnoringSafeArea(.all)
                .onTapGesture {
                    self.endTextEditing()
                }

            VStack(spacing: 60) {
                Text(Localize.Registration.title.text)
                    .font(.november(weight: .bold(size: 25)))
                    .foregroundColor(.black)
                    .padding(.bottom, 30)

                VStack(spacing: 25) {
                    TextField(Localize.Registration.name.text, text: $name)
                        .frame(height: 45)
                        .padding(.horizontal, 10)
                        .overlay(RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.border, lineWidth: 1)
                        )

                    TextField(Localize.Start.login.text, text: $login)
                        .frame(height: 45)
                        .padding(.horizontal, 10)
                        .overlay(RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.border, lineWidth: 1)
                        )

                    SecureField(Localize.Start.password.text, text: $password)
                        .frame(height: 45)
                        .padding(.horizontal, 10)
                        .overlay(RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.border, lineWidth: 1)
                        )

                    SecureField(Localize.Registration.repeatPassword.text, text: $repeatPassword)
                        .frame(height: 45)
                        .padding(.horizontal, 10)
                        .overlay(RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.border, lineWidth: 1)
                        )
                }

                ButtonView(title: Localize.Registration.apply.text, color: .violet)
                    .frame(height: 45)

                Spacer()
            }
            .padding(.horizontal, 20)
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: NaviigationBarBackButtonView())
    }
}
