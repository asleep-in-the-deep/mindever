import SwiftUI

struct BeliefsView: View {

    @State var selectedDay: WeekDays?

    @State var isPickingDate: Bool = false
    @State var pickedDate = Date()

    var body: some View {
        VStack {
            MainNavigationView(title: Localize.Tab.beliefs.text,
                               showDatePicker: $isPickingDate
            )

            VStack {
                WeekCalendarView(selectedDay: $selectedDay, pickedDate: $pickedDate)

                Spacer()
            }
            .padding(.horizontal, 20)
        }
        .navigationBarHidden(true)
        .navigationTitle("")
    }
}
