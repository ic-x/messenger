//
//  TermsOfUseView.swift
//  Messenger
//
//  Created by Clark Adams on 6/12/24.
//

import SwiftUI

struct TermsOfUseView: View {
    @Environment(\.presentationMode) var presentationMode
    @StateObject private var viewModel = TermsOfUseViewModel()
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVStack(alignment: .leading, spacing: 20) {
                    Text("Условия использования")
                        .font(.title)
                        .bold()
                    
                    ForEach(viewModel.sections, id: \.title) { section in
                        Group {
                            Text(section.title)
                                .font(.headline)
                            Text(section.content)
                        }
                    }
                }
                .padding()
            }
            
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Text("Закрыть")
            }
            .padding()
        }
        .navigationTitle("Условия использования")
    }
}

#Preview {
    TermsOfUseView()
}
