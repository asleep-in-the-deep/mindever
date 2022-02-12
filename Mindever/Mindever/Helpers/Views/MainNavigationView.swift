import SwiftUI

struct MainNavigationView: View {

    let title: String

    @Binding var showDatePicker: Bool

    var body: some View {
        HStack(spacing: 15) {
            MoreNavigationButton(imageName: "ellipsis")

            Spacer()
                .frame(width: 22)

            Spacer()

            Text(title)
                .font(.november(weight: .bold(size: 18)))

            Spacer()

            NavigationButton(imageName: "calendar", setAction: $showDatePicker)

            NavigationButton(imageName: "plus", setAction: $showDatePicker)
        }
        .frame(height: 50)
        .padding(.horizontal, 20)
        .background(Color.white
                        .cornerRadius(25, corners: [.bottomLeft, .bottomRight])
                        .edgesIgnoringSafeArea(.top)
                        .shadow(radius: 20, x: 0, y: -20)
        )
    }
}

fileprivate struct MoreNavigationButton: View {

    let imageName: String

    var body: some View {
        Menu {
            Button {
                print("tap chart")
            } label: {
                Label(Localize.Navigation.charts.text, systemImage: "chart.xyaxis.line")
            }

            Button {
                print("doc tap")
            } label: {
                Label(Localize.Navigation.download.text, systemImage: "arrow.down.doc")
            }
        } label: {
            NavigationButtonImage(imageName: imageName)
        }
    }
}

fileprivate struct NavigationButton: View {

    let imageName: String

    @Binding var setAction: Bool

    var body: some View {
        Button {
            setAction.toggle()
        } label: {
            NavigationButtonImage(imageName: imageName)
        }
    }
}

fileprivate struct NavigationButtonImage: View {

    let imageName: String

    var body: some View {
        Image(systemName: imageName)
            .font(.system(size: 22, weight: .medium))
            .foregroundColor(.violet)
    }
}
