import SwiftUI

struct MoodView: View {

    @State var selectedDay: WeekDays?

    var body: some View {
        GeometryReader { proxy in
            VStack {
                WeekCalendarView(selectedDay: $selectedDay)

                Spacer()
            }
            .padding(.horizontal, 20)
        }
        .navigationBarHidden(true)
    }

    
}


