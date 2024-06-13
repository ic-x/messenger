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
                .font(.title)
                .bold()
                .padding()
            
            Text("Нажимая кнопку «Начать общаться», я соглашаюсь с ")
                .font(.caption)
            HStack(spacing: 0) {
                Button(action: {
                    viewModel.showPrivacyPolicy()
                }) {
                    Text("политикой конфиденциальности")
                        .font(.caption)
                }
                .sheet(isPresented: $viewModel.showingPrivacyPolicy) {
                    PrivacyPolicyView()
                }
                Text(" и ")
                    .font(.caption)
                Button(action: {
                    viewModel.showTermsOfUse()
                }) {
                    Text("условиями использования")
                        .font(.caption)
                }
                .sheet(isPresented: $viewModel.showingTermsOfUse) {
                    TermsOfUseView()
                }
            }
            
            Button(action: {
                viewModel.navigateToVerificationPhoneView(navigationPath: $navigationPath)
            }) {
                Text("Начать общаться")
                    .font(.title)
            }
            .padding()
        }
        .navigationTitle("")
    }
}

#Preview {
    WalkthroughView(navigationPath: .constant(NavigationPath()))
}
