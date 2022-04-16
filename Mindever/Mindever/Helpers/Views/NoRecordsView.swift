import SwiftUI

struct NoRecordsView: View {
    
    var body: some View {
        VStack {
            Spacer()

            Text(Localize.Base.noRecords.text)
                .font(.november(weight: .medium(size: 16)))

            Spacer()
        }
    }
}
