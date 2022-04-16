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
        .navigationBarHidden(true)
        .navigationTitle("")
    }
}

/* для выбора когнитивок
let names = [
        "Cyril",
        "Lana",
        "Mallory",
        "Sterling"
    ]
@State private var selection = Set<String>()
@State private var isEditMode: EditMode = .active

List(names, id: \.self, selection: $selection) { name in
    VStack(alignment: .leading) {
        Text(name)
        Text("lorem kfdskfsdkd fsdjhfdsh  hdfshjfsdhj fhdhfdjfh hfdjfhdjhf hfdjhfdhfhjd")
    }
}
.environment(\.editMode, self.$isEditMode)
.listStyle(.plain)
*/
