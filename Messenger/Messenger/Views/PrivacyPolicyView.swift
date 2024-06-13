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
        .navigationTitle("Политика конфиденциальности")
    }
}

#Preview {
    PrivacyPolicyView()
}
