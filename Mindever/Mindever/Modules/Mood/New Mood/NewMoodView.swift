import SwiftUI

struct NewMoodView: View {

    @Environment(\.dismiss) private var dismiss

    @State private var mood: Int = 3
    @State private var energy: Int = 3
    @State private var selfEsteem: Int = 3
    @State private var anxiety: Int = 0
    @State private var annoyance: Int = 0

    @State private var sleepTime: Date = CalendarManager.shared.getDefaultSleep()
    @State private var sleepQuality = 3
    
    var body: some View {
        VStack {
            RecordNavigationView {
                dismiss()
            } saveAction: {
                dismiss()
            }

            ScrollView {
                VStack(spacing: 30) {
                    MoodRecordView(score: $mood)

                    MoodParameterView(title: Localize.MoodRecord.energy.text,
                                      range: 1...5,
                                      score: $energy,
                                      needDivider: true
                    )

                    MoodParameterView(title: Localize.MoodRecord.selfEsteem.text,
                                      range: 1...5,
                                      score: $selfEsteem,
                                      needDivider: true
                    )

                    MoodParameterView(title: Localize.MoodRecord.anxiety.text,
                                      range: 0...3,
                                      score: $anxiety,
                                      needDivider: true
                    )

                    MoodParameterView(title: Localize.MoodRecord.annoyance.text,
                                      range: 0...3,
                                      score: $annoyance,
                                      needDivider: true
                    )

                    SleepRecordView(sleepTime: $sleepTime,
                                    sleepQuality: $sleepQuality
                    )
                }
                .padding(.vertical, 30)
                .padding(.horizontal, 20)
            }
        }
        .navigationBarHidden(true)
    }
}

fileprivate struct RecordTitleView: View {

    let title: String

    var body: some View {
        Text(title)
            .font(.november(weight: .regular(size: 16)))
            .multilineTextAlignment(.center)
    }
}

fileprivate struct MoodRecordView: View {

    @Binding var score: Int

    private var proxy: Binding<Double> {
        Binding<Double> {
            return Double(score)
        } set: { value in
            score = Int(value)
        }
    }

    var body: some View {
        VStack(spacing: 15) {
            RecordTitleView(title: Localize.MoodRecord.mood.text)

            VStack(spacing: 5) {
                Mood(rawValue: score)?.icon
                    .resizable()
                    .scaledToFit()
                    .frame(height: 50)

                Slider(value: proxy, in: 1...5, step: 1.0)
                    .tint(.violet)
            }

            Divider()
        }
    }
}

fileprivate struct MoodParameterView: View {

    let title: String

    let range: ClosedRange<Double>

    @Binding var score: Int

    let needDivider: Bool

    private var proxy: Binding<Double> {
        Binding<Double> {
            return Double(score)
        } set: { value in
            score = Int(value)
        }
    }

    var body: some View {
        VStack(spacing: 15) {
            RecordTitleView(title: title)

            VStack(spacing: 5) {
                Text(score.description)
                    .font(.november(weight: .bold(size: 18)))

                Slider(value: proxy, in: range, step: 1.0)
                    .tint(.violet)
            }

            if needDivider {
                Divider()
            }
        }
    }
}

fileprivate struct SleepRecordView: View {

    @Binding var sleepTime: Date

    @Binding var sleepQuality: Int
    
    var body: some View {
        VStack(spacing: 15) {
            RecordTitleView(title: Localize.MoodRecord.sleepDuration.text)

            DatePicker(selection: $sleepTime, displayedComponents: .hourAndMinute) {}
            .labelsHidden()

            MoodParameterView(title: Localize.MoodRecord.sleepQuality.text, range: 1...5, score: $sleepQuality, needDivider: false)
        }
    }
}
