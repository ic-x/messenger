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
                .multilineTextAlignment(.center)
                .padding()
            
            VStack {
                Text("Нажимая кнопку «Начать общаться», я соглашаюсь с ")
                HStack(spacing: 0) {
                    Button(action: {
                        viewModel.showPrivacyPolicy()
                    }) {
                        Text("политикой конфиденциальности")
                    }
                    .sheet(isPresented: $viewModel.showingPrivacyPolicy) {
                        PrivacyPolicyView()
                    }
                    Text(" и ")
                    Button(action: {
                        viewModel.showTermsOfUse()
                    }) {
                        Text("условиями использования")
                    }
                    .sheet(isPresented: $viewModel.showingTermsOfUse) {
                        TermsOfUseView()
                    }
                }
            }
            .font(.Typography.Metadata.metadata2)
            .lineSpacing(16)
            .frame(width: 327, height: 32)
            .multilineTextAlignment(.center)
            
            Button(action: {
                viewModel.navigateToVerificationPhoneView(navigationPath: $navigationPath)
            }) {
                Text("Начать общаться")
                    .font(.Typography.Subheading.sub2)
                    .lineSpacing(28)
                    .multilineTextAlignment(.center)
            }
            .padding()
        }
        .navigationTitle("")
        .background(Color("BrandColorDark"))
    }
}

#Preview {
    WalkthroughView(navigationPath: .constant(NavigationPath()))
}
