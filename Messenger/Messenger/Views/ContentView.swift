//
//  ContentView.swift
//  Messenger
//
//  Created by Clark Adams on 6/12/24.
//

import SwiftUI

struct ContentView: View {
    @State private var navigationPath = NavigationPath()
    @State private var selectedTab: Tab = .contacts
    
    var body: some View {
        NavigationStack(path: $navigationPath) {
            if false {
                MainView(selectedTab: $selectedTab)
            } else {
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
                        case .mainView:
                            MainView(selectedTab: $selectedTab)
                        }
                    }
            }
        }
    }
}

#Preview {
    ContentView()
}
