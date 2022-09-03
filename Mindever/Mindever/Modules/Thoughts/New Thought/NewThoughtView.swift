import SwiftUI

struct NewThoughtView: View {

    @StateObject private var viewModel = NewThoughtViewModel()

    @Environment(\.dismiss) private var dismiss

    var body: some View {
        GeometryReader { geometry in
            VStack {
                RecordNavigationView {
                    dismiss()
                } saveAction: {
                    dismiss()
                }

                TabView {
                    SituationView(viewModel: viewModel, geometry: geometry)

                    CognitiveDistortionsView()
                }
                .tabViewStyle(.page)
                .indexViewStyle(.page(backgroundDisplayMode: .always))
                .padding(.horizontal, 15)
            }
            .navigationBarHidden(true)
            .navigationTitle("")
        }
    }
}

fileprivate struct SituationView: View {

    @ObservedObject var viewModel: NewThoughtViewModel

    let geometry: GeometryProxy

    @State var situationText = Localize.Situation.placeholder.text
    private let placeholderText = Localize.Situation.placeholder.text

    var body: some View {
        VStack {
            Text(Localize.Situation.title.text)
                .font(.november(weight: .bold(size: 16)))
                .padding(.vertical, 15)

            TextEditor(text: $situationText)
                .font(.november(weight: .regular(size: 14)))
                .frame(height: geometry.size.height / 3, alignment: .center)
                .border(Color.border, width: 2, cornerRadius: 15)
                .foregroundColor(situationText == placeholderText ? .border : .black)
                .onTapGesture {
                    if situationText == placeholderText {
                        situationText = ""
                    }
                }

            Spacer()
        }
    }
}

fileprivate struct CognitiveDistortionsView: View {

    let distostions = [
        Localize.Distortions.allOrNothing.text,
        Localize.Distortions.overgeneralization.text,
        Localize.Distortions.negativeFilter.text,
        Localize.Distortions.positiveMinimization.text,
        Localize.Distortions.quicklyConclusions.text,
        Localize.Distortions.exaggerationOrUnterstatement.text,
        Localize.Distortions.necessity.text,
        Localize.Distortions.labeling.text,
        Localize.Distortions.personalization.text
    ]
    @State private var selection = Set<String>()
    @State private var isEditMode: EditMode = .active

    var body: some View {
        VStack {
            Text(Localize.Distortions.title.text)
                .font(.november(weight: .bold(size: 16)))
                .padding(.vertical, 15)
            
            List(distostions, id: \.self, selection: $selection) { distortion in
                VStack(alignment: .leading) {
                    Text(distortion)
                        .font(.november(weight: .regular(size: 14)))
                }
            }
            .environment(\.editMode, self.$isEditMode)
            .listStyle(.plain)
        }
    }
}
