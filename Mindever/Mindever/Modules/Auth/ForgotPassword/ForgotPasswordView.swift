import SwiftUI

struct ForgotPasswordView: View {

    @State var login: String = ""

    var body: some View {
        ZStack {
            Color.background.edgesIgnoringSafeArea(.all)
                .onTapGesture {
                    self.endTextEditing()
                }
            VStack(spacing: 60) {
                Text(Localize.ForgotPassword.title.text)
                    .font(.november(weight: .bold(size: 25)))
                    .foregroundColor(.black)
                    .padding(.bottom, 30)

                TextField(Localize.Start.login.text, text: $login)
                    .frame(height: 45)
                    .padding(.horizontal, 10)
                    .overlay(RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.border, lineWidth: 1)
                    )

                ButtonView(title: Localize.Base.submit.text, color: .violet)
                    .frame(height: 45)

                Spacer()
            }
            .padding(.horizontal, 20)
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: NaviigationBarBackButtonView())
    }

}
