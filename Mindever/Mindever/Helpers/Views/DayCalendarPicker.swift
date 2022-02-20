import SwiftUI

struct DayCalendarPicker: View {

    @Binding var isPicking: Bool
    @Binding var date: Date

    var body: some View {
        VStack(alignment: .center, spacing: 15) {
            HStack {
                Spacer()

                Text(Localize.Navigation.selectDay.text)
                    .font(.november(weight: .medium(size: 17)))

                Spacer()

                Button {
                    isPicking.toggle()
                } label: {
                    Image(systemName: "xmark")
                        .font(.system(size: 20))
                        .foregroundColor(.black)
                }
            }
            .padding(.horizontal, 5)

            DatePicker(Localize.Navigation.date.text, selection: $date, displayedComponents: .date)
                .datePickerStyle(GraphicalDatePickerStyle())
                .accentColor(.violet)
        }
        .padding(.all, 20)
        .background(RoundedRectangle(cornerRadius: 10)
                        .fill(Color.white)
                        .shadow(radius: 20)
        )
        .onChange(of: date) { _ in
            isPicking.toggle()
        }
    }
}
