import SwiftUI

struct ThoughtsView: View {

    @State var selectedDay: WeekDay?

    @State var isPickingDate: Bool = false
    @State var pickedDate = Date()
    
    var body: some View {
        VStack {
            MainNavigationView(title: Localize.Tab.thoughts.text,
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
