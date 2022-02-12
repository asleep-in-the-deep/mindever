import SwiftUI

struct MoodView: View {

    @State var selectedDay: WeekDays?

    @State var isPickingDate: Bool = false
    @State var pickedDate = Date()

    var body: some View {
        VStack {
            MainNavigationView(title: Localize.Tab.mood.text,
                               showDatePicker: $isPickingDate
            )

            VStack {
                WeekCalendarView(selectedDay: $selectedDay, pickedDate: $pickedDate)
                    .padding(.horizontal, 20)

                Spacer()
            }

        }
        .navigationBarHidden(true)
        .navigationTitle("")
        .blur(radius: isPickingDate ? 50 : 0)
        .overlay {
            if isPickingDate {
                SelectDatePicker(isPicking: $isPickingDate, date: $pickedDate)
                    .padding(.horizontal, 20)
            }
        }
    }
    
}

fileprivate struct MoodCellView: View {

    var body: some View {
        VStack {

        }
    }
}


