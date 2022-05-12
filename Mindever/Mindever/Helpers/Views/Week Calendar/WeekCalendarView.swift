import SwiftUI

struct WeekCalendarView: View {

    @State var days: [WeekDay] = []

    @State var monthYearTitle: String = ""

    @Binding var selectedDay: WeekDay?
    @Binding var pickedDate: Date
    @Binding var recordDates: Set<Date>

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

                Text(monthYearTitle.capitalizeInSentence())
                    .font(.november(weight: .medium(size: 16)))
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
                            .foregroundColor(setColor(for: day))

                        Text(day.day)
                            .font(.november(weight: .medium(size: 14)))
                            .foregroundColor(setColor(for: day))

                        Circle()
                            .frame(width: 5, height: 5)
                            .foregroundColor(day.hasRecords ? .aquamarine : .clear)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.all, 10)
                    .background(setBackground(for: day))
                    .cornerRadius(10)
                    .overlay {
                        if CalendarManager.shared.checkIsToday(date: day.date) {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.violet, lineWidth: 2)
                        } else if day != selectedDay {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.border, lineWidth: 1)
                        }
                    }
                    .onTapGesture {
                        selectedDay = day
                    }
                }
            }
            .padding(.bottom, 20)

            Divider()
        }
        .padding(.vertical, 20)
        .onAppear {
            self.setWeek()
        }
        .onChange(of: recordDates, perform: { _ in
            self.setWeek()
        })
        .onChange(of: pickedDate, perform: { _ in
            self.setPickedDate()
        })
    }

    private func setWeek(byAdding value: Int = 0, for date: Date = Date()) {
        let week = CalendarManager.shared.getWeek(byAdding: value, for: date, records: recordDates)
        self.monthYearTitle = week[3].monthAndYear        
        self.days = week
        self.setToday()
    }

    private func setToday() {
        for (index, day) in days.enumerated() {
            if CalendarManager.shared.checkIsToday(date: day.date) {
                self.selectedDay = days[index]
            }
        }
    }

    private func setPickedDate() {
        self.setWeek(byAdding: 0, for: pickedDate)
        for (index, day) in days.enumerated() {
            if CalendarManager.shared.checkDayIsSameAs(pickedDate: pickedDate, date: day.date) {
                self.selectedDay = days[index]
            }
        }
    }

    private func setColor(for day: WeekDay) -> Color {
        return day == selectedDay ? Color.white : Color.black
    }

    private func setBackground(for day: WeekDay) -> Color {
        return day == selectedDay ? Color.violet : Color.clear
    }
}
