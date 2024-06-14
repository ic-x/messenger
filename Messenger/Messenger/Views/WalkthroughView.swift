//
//  WalkthroughView.swift
//  Messenger
//
//  Created by Clark Adams on 6/12/24.
//

import SwiftUI

struct WalkthroughView: View {
    @Binding var navigationPath: NavigationPath
    @StateObject private var viewModel = WalkthroughViewModel()
    
    var body: some View {
        VStack {
            Text("Общайтесь с друзьями и близкими легко")
                .font(.Typography.Heading.h2)
                .padding()
            
            Text("Нажимая кнопку «Начать общаться», я соглашаюсь с ")
                .font(.Typography.Metadata.metadata2)
            HStack(spacing: 0) {
                Button(action: {
                    viewModel.showPrivacyPolicy()
                }) {
                    Text("политикой конфиденциальности")
                        .font(.Typography.Metadata.metadata2)
                }
                .sheet(isPresented: $viewModel.showingPrivacyPolicy) {
                    PrivacyPolicyView()
                }
                Text(" и ")
                    .font(.Typography.Metadata.metadata2)
                Button(action: {
                    viewModel.showTermsOfUse()
                }) {
                    Text("условиями использования")
                        .font(.Typography.Metadata.metadata2)
                }
                .sheet(isPresented: $viewModel.showingTermsOfUse) {
                    TermsOfUseView()
                }
            }
            
            Button(action: {
                viewModel.navigateToVerificationPhoneView(navigationPath: $navigationPath)
            }) {
                Text("Начать общаться")
                    .font(.Typography.Subheading.sub2)
            }
            .padding()
        }
        .navigationTitle("")
    }
}

#Preview {
    WalkthroughView(navigationPath: .constant(NavigationPath()))
}
