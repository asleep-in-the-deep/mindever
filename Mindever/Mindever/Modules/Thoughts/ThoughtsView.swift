import SwiftUI

struct ThoughtsView: View {

    @State var selectedDay: WeekDay?

    @State var isPickingDate: Bool = false
    @State var pickedDate = Date()

    @State var showNewThought: Bool = false

    @State var recordDates: Set<Date> = []
    
    var body: some View {
        VStack {
            MainNavigationView(title: Localize.Tab.thoughts.text,
                               showDatePicker: $isPickingDate,
                               addNewRecord: $showNewThought
            )

            VStack {
                WeekCalendarView(selectedDay: $selectedDay,
                                 pickedDate: $pickedDate,
                                 recordDates: $recordDates
                )

                Spacer()

            }
            .padding(.horizontal, 20)
        }
        .navigate(isActive: $showNewThought) {
            NewThoughtView()
        }
        .navigationBarHidden(true)
        .navigationTitle("")
    }
}


