import SwiftUI

struct ThoughtsView: View {

    @State var selectedDay: WeekDays?
    
    var body: some View {
        VStack {
            WeekCalendarView(selectedDay: $selectedDay)

            Spacer()
        }
        .padding(.horizontal, 20)
        .navigationBarHidden(true)
    }
}
