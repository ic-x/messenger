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
                        .font(.Typography.Heading.h2)
                    
                    ForEach(viewModel.sections, id: \.title) { section in
                        VStack(alignment: .leading, spacing: 5) {
                            Text(section.title)
                                .font(.Typography.Subheading.sub1)
                            Text(section.content)
                                .font(.Typography.Body.body2)
                                .multilineTextAlignment(.leading)
                                .lineSpacing(2)
                        }
                    }
                }
                .padding()
            }
            
            Spacer()
            
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Text("Закрыть")
                    .font(.Typography.Subheading.sub2)
                    .padding()
            }
        }
        .navigationTitle("Условия использования")
    }
}

#Preview {
    TermsOfUseView()
}
