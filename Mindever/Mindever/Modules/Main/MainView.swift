import SwiftUI

struct MainView: View {

    @StateObject private var viewModel = MainViewModel()

    var body: some View {
        NavigationView {
            ZStack(alignment: .bottom) {
                TabView(selection: $viewModel.selected) {
                    MoodView()
                        .tag(TabType.mood)

                    ThoughtsView()
                        .tag(TabType.thoughts)

                    BeliefsView()
                        .tag(TabType.beliefs)

                    SettingsView()
                        .tag(TabType.settings)
                }

                TabBarView(viewModel: viewModel)
            }
        }
    }
}

fileprivate struct TabBarView: View {

    @ObservedObject var viewModel: MainViewModel

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Rectangle()
                    .cornerRadius(25, corners: [.topLeft, .topRight])
                    .foregroundColor(.white)
                    .edgesIgnoringSafeArea(.bottom)
                    .shadow(radius: 20, x: 0, y: 20)

                HStack(alignment: .bottom) {
                    ForEach(viewModel.tabs, id: \.self) { tab in
                        TabBarViewItem(viewModel: viewModel, item: tab)
                    }
                }
                .padding(.all, 10)
            }
        }
        .frame(height: 60)
    }
}

fileprivate struct TabBarViewItem: View {

    @ObservedObject var viewModel: MainViewModel

    let item: TabType

    var body: some View {
        Button {
            viewModel.selected = item
        } label: {
            TabBarItem(data: item.tabItem, selected: item == viewModel.selected)
                .frame(maxWidth: .infinity)
        }
    }
}

fileprivate struct TabBarItem: View {

    let data: TabItemData
    let selected: Bool

    var body: some View {
        VStack(alignment: .center, spacing: 5) {
            Image(systemName: data.image)
                .resizable()
                .scaledToFit()
                .frame(height: 25)
                .foregroundColor(selected ? .violet : .gray)

            Text(data.title)
                .font(.november(weight: selected ? .medium(size: 12) : .regular(size: 12)))
                .foregroundColor(selected ? .violet : .gray)
        }
    }
}
