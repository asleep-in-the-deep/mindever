import SwiftUI

struct SelectDatePicker: View {

    @Binding var isPicking: Bool
    @Binding var date: Date

    var body: some View {
        VStack(alignment: .center, spacing: 15) {
            Text(Localize.Navigation.selectDay.text)
                .font(.november(weight: .medium(size: 18)))

            DatePicker(Localize.Navigation.date.text, selection: $date, displayedComponents: .date)
                .datePickerStyle(GraphicalDatePickerStyle())
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
