import SwiftUI

struct RecordNavigationView: View {

    @State private var tapCancel: Bool = false
    @State private var tapSave: Bool = false

    var cancelAction: (() -> Void)
    var saveAction: (() -> Void)
    
    var body: some View {
        HStack {
            Button {
                tapCancel.toggle()
            } label: {
                Text(Localize.Navigation.cancel.text)
                    .font(.november(weight: .medium(size: 14)))
                    .foregroundColor(.violet)
            }

            Spacer()

            Text(Localize.Navigation.newRecord.text)
                .font(.november(weight: .medium(size: 16)))

            Spacer()

            Button {
                tapSave.toggle()
            } label: {
                Text(Localize.Navigation.save.text)
                    .font(.november(weight: .medium(size: 14)))
                    .foregroundColor(.violet)
            }
        }
        .frame(height: 50)
        .padding(.horizontal, 20)
        .background(Color.white
                        .cornerRadius(25, corners: [.bottomLeft, .bottomRight])
                        .edgesIgnoringSafeArea(.top)
                        .shadow(radius: 20, x: 0, y: -20)
        )
        .confirmationDialog(Localize.Action.exitTitle.text, isPresented: $tapCancel) {
            Button(Localize.Action.exit.text, role: .destructive) {
                cancelAction()
            }

            Button(Localize.Action.cancel.text, role: .cancel) { }
        }
        .confirmationDialog(Localize.Action.saveTitle.text, isPresented: $tapSave) {
            Button(Localize.Action.save.text) {
                saveAction()
            }

            Button(Localize.Action.cancel.text, role: .cancel) { }
        }
    }
}

//struct RecordNavigationView_Previews: PreviewProvider {
//    static var previews: some View {
//        RecordNavigationView()
//    }
//}
