import SwiftUI

struct TutorialView: View {

    private let items: [TutorialModel]
    private let interval: Double

    private let gradient: [Color]

    @ObservedObject var tutorialTimer: TutorialTimer = TutorialTimer()

    init(
        items: [TutorialModel],
        interval: Double,
        gradient: [Color] = [.violet, .stateBlue]
    ) {
        self.items = items
        self.interval = interval
        self.gradient = gradient
    }

    @State private var isAnimating = false

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                VStack(alignment: .leading) {

                    VStack(alignment: .trailing, spacing: 15) {

                        HStack(alignment: .center, spacing: 5) {
                            ForEach(items.indices) { index in
                                LoadingRectangle(progress: min(max(CGFloat(self.tutorialTimer.progress - CGFloat(index)), 0.0), 1.0))
                                    .frame(height: 2, alignment: .leading)
                                    .animation(.linear, value: isAnimating)
                            }
                        }

                        Image(systemName: "xmark")
                            .font(.system(size: 25))
                            .foregroundColor(.white.opacity(0.9))
                    }

                    Spacer()

                    VStack(alignment: .leading, spacing: 15) {
                        Text(self.items[Int(self.tutorialTimer.progress)].title)
                            .font(.november(weight: .medium(size: 25)))
                            .foregroundColor(.white)

                        Spacer()

                        Button {
                            print("tapped")
                        } label: {
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(.white)
                                .frame(height: 45)
                                .overlay(alignment: .center) {
                                    LinearGradient(colors: [.violet, .stateBlue], startPoint: .topLeading, endPoint: .bottomTrailing)
                                        .mask {
                                            Text("Button")
                                                .font(.november(weight: .bold(size: 16)))
                                        }
                                }
                        }
                    }

                    Spacer()
                }
                .padding(.all, 20)


                HStack(alignment: .top, spacing: 0) {
                    Rectangle()
                        .foregroundColor(.clear)
                        .contentShape(Rectangle())
                        .frame(height: geometry.size.height * 0.8)
                        .onTapGesture {
                            self.tutorialTimer.advance(by: -1, count: items.count)
                        }

                    Rectangle()
                        .foregroundColor(.clear)
                        .contentShape(Rectangle())
                        .frame(height: geometry.size.height * 0.8)
                        .onTapGesture {
                            self.tutorialTimer.advance(by: 1, count: items.count)
                        }
                }
            }

        }
        .background(LinearGradient(colors: gradient, startPoint: .topLeading, endPoint: .bottomTrailing))
        .onAppear {
            self.tutorialTimer.start(count: items.count, interval: interval)
        }
        .onDisappear {
            self.tutorialTimer.cancel()
        }
    }
}
