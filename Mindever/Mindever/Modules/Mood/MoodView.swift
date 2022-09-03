import SwiftUI
import SwiftUIX

struct MoodView: View {

    @StateObject private var viewModel = MoodViewModel()

    @State var isPickingDate: Bool = false
    @State var pickedDate = Date()

    @State var showNewMood: Bool = false

    var body: some View {
        VStack {
            MainNavigationView(title: Localize.Tab.mood.text,
                               showDatePicker: $isPickingDate,
                               addNewRecord: $showNewMood
            )

            ScrollView {
                VStack {
                    WeekCalendarView(selectedDay: $viewModel.selectedDay,
                                     pickedDate: $pickedDate,
                                     recordDates: $viewModel.recordDates
                    )

                    if !viewModel.dayMoods.isEmpty {
                        if let sleep = viewModel.daySleep {
                            SleepView(sleep: sleep)
                        }

                        VStack(spacing: 15) {
                            ForEach(viewModel.dayMoods, id: \.self) { mood in
                                MoodCellView(viewModel: viewModel, mood: mood)
                            }
                        }
                    } else {
                        NoRecordsView()
                    }
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 30)
            }
        }
        .navigationBarHidden(true)
        .navigationTitle("")
        .blur(radius: isPickingDate || viewModel.showActivityIndicator ? 50 : 0)
        .disabled(isPickingDate || viewModel.showActivityIndicator)
        .showLoading(isActive: viewModel.showActivityIndicator)
        .overlay {
            if isPickingDate {
                DayCalendarPicker(isPicking: $isPickingDate, date: $pickedDate)
                    .padding(.horizontal, 20)
            }
        }
        .navigate(isActive: $showNewMood) {
            NewMoodView(noSleepRecord: viewModel.daySleep == nil)
        }
        .onAppear {
            viewModel.getData()
        }
    }
    
}

fileprivate struct SleepView: View {

    let sleep: SleepRecord

    var body: some View {
        VStack {
            HStack(alignment: .center, spacing: 5) {
                Image(systemName: "moon.zzz")
                    .font(.system(size: 15))

                Text(Localize.Sleep.sleep.text)
                    .font(.november(weight: .bold(size: 14)))
            }
            .padding(.top, 10)

            HStack {
                Text(Localize.Sleep.duration(hours: sleep.duration).text)
                    .font(.november(weight: .regular(size: 13)))

                Spacer()

                Text(Localize.Sleep.quality(value: sleep.quality).text)
                    .font(.november(weight: .regular(size: 13)))
            }
            .padding(.horizontal, 15)
        }
        .padding(.bottom, 15)
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .overlay(RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.border, lineWidth: 1)
        )
        .contextMenu {
            Button {

            } label: {
                Label(Localize.Action.edit.text, systemImage: "square.and.pencil")
            }
        }
    }
}

fileprivate struct MoodCellView: View {

    @ObservedObject var viewModel: MoodViewModel

    let mood: MoodRecord

    var body: some View {
        VStack(spacing: 10) {
            HStack {
                Spacer()

                Text(mood.time)
                    .font(.november(weight: .medium(size: 14)))
                    .foregroundColor(.white)

                Spacer()
            }
            .frame(height: 30)
            .background(Color.violet
                        .cornerRadius(10, corners: [.topLeft, .topRight])
            )

            HStack(alignment: .center) {
                VStack {
                    Mood(rawValue: mood.mood)?.icon
                        .resizable()
                        .scaledToFit()
                        .frame(height: 50)

                    Text(Mood(rawValue: mood.mood)?.name ?? "")
                        .font(.november(weight: .medium(size: 14)))
                }

                Spacer()

                HStack(alignment: .center, spacing: 20) {
                    VStack(alignment: .leading, spacing: 15) {
                        HStack(alignment: .center, spacing: 5) {
                            Image(systemName: "eyes")
                                .font(.system(size: 15, weight: .light))

                            Text(Localize.Emotion.anxiety(value: mood.anxiety).text)
                                .font(.november(weight: .regular(size: 13)))
                        }

                        HStack(alignment: .center, spacing: 5) {
                            Image(systemName: "bolt")
                                .font(.system(size: 15, weight: .light))

                            Text(Localize.Emotion.energy(value: mood.energy).text)
                                .font(.november(weight: .regular(size: 13)))
                        }
                        .padding(.leading, 5)
                    }

                    VStack(alignment: .leading, spacing: 15) {
                        HStack(alignment: .center, spacing: 5) {
                            Image(systemName: "flame")
                                .font(.system(size: 15, weight: .light))

                            Text(Localize.Emotion.annoyance(value: mood.annoyance).text)
                                .font(.november(weight: .regular(size: 13)))
                        }

                        HStack(alignment: .center, spacing: 5) {
                            Image(systemName: "person.crop.artframe")
                                .font(.system(size: 15, weight: .light))

                            Text(Localize.Emotion.selfEsteem(value: mood.selfEsteem).text)
                                .font(.november(weight: .regular(size: 13)))
                        }
                    }
                }

            }
            .padding(.horizontal, 15)
        }
        .padding(.bottom, 10)
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .overlay(RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.border, lineWidth: 1)
        )
        .contextMenu {
            Button {

            } label: {
                Label(Localize.Action.edit.text, systemImage: "square.and.pencil")
            }

            Button(role: .destructive) {
                viewModel.deleteMood(with: mood.id)
            } label: {
                Label(Localize.Action.delete.text, systemImage: "trash")
            }
        }
    }
}


