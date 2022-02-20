import SwiftUI

struct BeliefsView: View {

    @State var selectedDay: WeekDay?

    @State var isPickingDate: Bool = false
    @State var pickedDate = Date()

    @State var showNewBelief: Bool = false

    var body: some View {
        VStack {
            MainNavigationView(title: Localize.Tab.beliefs.text,
                               showDatePicker: $isPickingDate,
                               addNewRecord: $showNewBelief
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
