//
//  ContentView.swift
//  Messenger
//
//  Created by Clark Adams on 6/12/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var appState = AppState()
    @State private var navigationPath = NavigationPath()
    
    var body: some View {
        Group {
            switch appState.currentView {
            case .main:
                MainView()
            case .walkthrough:
                NavigationStack(path: $navigationPath) {
                    WalkthroughView(navigationPath: $navigationPath)
                        .navigationDestination(for: NavigationItem.self) { item in
                            switch item {
                            case .verificationPhoneView:
                                VerificationPhoneView(navigationPath: $navigationPath)
                            case .verificationCodeView(let phoneNumber):
                                VerificationCodeView(navigationPath: $navigationPath, viewModel: VerificationCodeViewModel(phoneNumber: phoneNumber))
                            case .profileAccountView(let phoneNumber):
                                ProfileAccountView(navigationPath: $navigationPath, viewModel: ProfileAccountViewModel(phoneNumber: phoneNumber))
                                    .environmentObject(appState)
                            }
                        }
                }
            }
        }
        .environmentObject(appState)
    }
}

#Preview {
    ContentView()
}
