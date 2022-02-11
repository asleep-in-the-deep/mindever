import SwiftUI

struct WeekCalendarView: View {

    @State var days: [WeekDays] = []

    @State var monthYearTitle: String = ""

    @Binding var selectedDay: WeekDays?

    var body: some View {
        VStack {
            HStack {
                Button {
                    self.setWeek(byAdding: -7, for: days[0].date)
                } label: {
                    Image(systemName: "chevron.left")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(.violet)
                }

                Text(monthYearTitle)
                    .font(.november(weight: .bold(size: 20)))
                    .frame(maxWidth: .infinity)

                Button {
                    self.setWeek(byAdding: 7, for: days[0].date)
                } label: {
                    Image(systemName: "chevron.right")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(.violet)
                }
            }

            HStack(alignment: .top, spacing: 5) {
                ForEach(days, id: \.self) { day in
                    VStack(alignment: .center, spacing: 5) {
                        Text(day.dayOfWeek)
                            .font(.november(weight: .regular(size: 12)))
                            .foregroundColor(.white)

                        Text(day.day)
                            .font(.november(weight: .medium(size: 14)))
                            .foregroundColor(.white)

                        Circle()
                            .frame(width: 5, height: 5)
                            .foregroundColor(day.hasRecords ? .white : .clear)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.all, 10)
                    .background(LinearGradient(colors: [.violet, .stateBlue], startPoint: .top, endPoint: .bottom))
                    .cornerRadius(10)
                    .overlay {
                        if day == selectedDay {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.darkPurple, lineWidth: 5)
                        }
                    }
                    .onTapGesture {
                        selectedDay = day
                    }
                }
            }
        }
        .onAppear {
            self.setWeek()
        }
    }

    private func setWeek(byAdding value: Int = 0, for date: Date = Date()) {
        let week = CalendarManager.shared.getWeek(byAdding: value, for: date)
        self.monthYearTitle = week[3].monthAndYear
        self.days = week
        self.setToday()
    }

    private func setToday() {
        for (index, day) in days.enumerated() {
            if CalendarManager.shared.checkIsToday(date: day.date) {
                days[index].hasRecords = true
                self.selectedDay = days[index]
            }
        }
    }
}
