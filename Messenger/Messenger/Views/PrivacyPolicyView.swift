//
//  PrivacyPolicyView.swift
//  Messenger
//
//  Created by Clark Adams on 6/12/24.
//

import SwiftUI

struct PrivacyPolicyView: View {
    @Environment(\.presentationMode) var presentationMode
    @StateObject private var viewModel = PrivacyPolicyViewModel()
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVStack(alignment: .leading, spacing: 20) {
                    Text("Политика конфиденциальности")
                        .font(.Typography.Heading.h2)
                    
                    ForEach(viewModel.sections, id: \.title) { section in
                        Group {
                            Text(section.title)
                                .font(.Typography.Subheading.sub1)
                            Text(section.content)
                                .font(.Typography.Body.body2)
                        }
                    }
                }
                .padding()
            }
            
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Text("Закрыть")
                    .font(.Typography.Subheading.sub2)
                    .padding()
            }
            .padding()
        }
        .navigationTitle("Политика конфиденциальности")
    }
}

#Preview {
    PrivacyPolicyView()
}
