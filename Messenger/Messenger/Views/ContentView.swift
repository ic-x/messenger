//
//  ContentView.swift
//  Messenger
//
//  Created by Clark Adams on 6/12/24.
//

import SwiftUI

struct ContentView: View {
    @State private var navigationPath = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $navigationPath) {
            WalkthroughView(navigationPath: $navigationPath)
                .navigationDestination(for: NavigationItem.self) { item in
                    switch item {
                    case .verificationPhoneView:
                        VerificationPhoneView(navigationPath: $navigationPath
                        )
                    case .verificationCodeView(let phoneNumber):
                        VerificationCodeView(
                            navigationPath: $navigationPath,
                            viewModel: VerificationCodeViewModel(phoneNumber: phoneNumber)
                        )
                    case .profileAccountView(let phoneNumber):
                        ProfileAccountView(
                            navigationPath: $navigationPath,
                            viewModel: ProfileAccountViewModel(phoneNumber: phoneNumber)
                        )
                    }
                }
        }
    }
}

#Preview {
    ContentView()
}
