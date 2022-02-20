import SwiftUI

struct RecordDatePickerView: View {

    @Binding var selectedDate: Date
    
    @Binding var selectedTime: Date

    var body: some View {
        VStack(spacing: 20) {
            DatePicker(selection: $selectedDate, displayedComponents: .date) {
                Text("Выберите дату")
                    .font(.november(weight: .regular(size: 14)))
            }

            DatePicker(selection: $selectedTime, displayedComponents: .hourAndMinute) {
                Text("Выберите время")
                    .font(.november(weight: .regular(size: 14)))
            }
        }
    }
}
