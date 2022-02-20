import SwiftUI
import SwiftUIX

struct MoodView: View {

    @State var selectedDay: WeekDay?

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
                    WeekCalendarView(selectedDay: $selectedDay, pickedDate: $pickedDate)

                    SleepView()
                        .padding(.bottom, 20)

                    MoodCellView()
                        .padding(.bottom, 15)
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 30)
            }
        }
        .navigationBarHidden(true)
        .navigationTitle("")
        .blur(radius: isPickingDate ? 50 : 0)
        .disabled(isPickingDate)
        .overlay {
            if isPickingDate {
                DayCalendarPicker(isPicking: $isPickingDate, date: $pickedDate)
                    .padding(.horizontal, 20)
            }
        }
        .navigate(isActive: $showNewMood) {
            NewMoodView()
        }
    }
    
}

fileprivate struct SleepView: View {

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
                Text(Localize.Sleep.duration(hours: "0:00").text)
                    .font(.november(weight: .regular(size: 13)))

                Spacer()

                Text(Localize.Sleep.quality(value: 0).text)
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

    var body: some View {
        VStack(spacing: 10) {
            HStack {
                Spacer()

                Text("15:45")
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
                    Image(systemName: "face.smiling")
                        .font(.system(size: 50))

                    Text(Localize.Mood.normal.text)
                        .font(.november(weight: .medium(size: 14)))
                }

                Spacer()

                HStack(alignment: .center, spacing: 20) {
                    VStack(alignment: .leading, spacing: 15) {
                        HStack(alignment: .center, spacing: 5) {
                            Image(systemName: "eyes")
                                .font(.system(size: 15, weight: .light))

                            Text(Localize.Emotion.anxiety(value: 0).text)
                                .font(.november(weight: .regular(size: 13)))
                        }

                        HStack(alignment: .center, spacing: 5) {
                            Image(systemName: "bolt")
                                .font(.system(size: 15, weight: .light))

                            Text(Localize.Emotion.energy(value: 0).text)
                                .font(.november(weight: .regular(size: 13)))
                        }
                        .padding(.leading, 5)
                    }

                    VStack(alignment: .leading, spacing: 15) {
                        HStack(alignment: .center, spacing: 5) {
                            Image(systemName: "flame")
                                .font(.system(size: 15, weight: .light))

                            Text(Localize.Emotion.annoyance(value: 0).text)
                                .font(.november(weight: .regular(size: 13)))
                        }

                        HStack(alignment: .center, spacing: 5) {
                            Image(systemName: "person.crop.artframe")
                                .font(.system(size: 15, weight: .light))

                            Text(Localize.Emotion.selfEsteem(value: 0).text)
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

            Button {

            } label: {
                Label(Localize.Action.delete.text, systemImage: "trash")
                    .foregroundColor(.red)
            }
        }
    }
}


