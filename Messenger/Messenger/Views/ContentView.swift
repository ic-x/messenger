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
    @State private var showChatsView = false
    
    var body: some View {
        Group {
            switch appState.currentView {
            case .main:
                MainView()
                    .onAppear {
                        NotificationCenter.default.addObserver(forName: .openChats, object: nil, queue: .main) { _ in
                            showChatsView = true
                        }
                    }
                    .fullScreenCover(isPresented: $showChatsView) {
                        ChatsView()
                    }
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
        .onOpenURL { url in
            handleDeepLink(url: url)
        }
    }
}

extension ContentView {
    private func handleDeepLink(url: URL) {
        guard let components = URLComponents(url: url, resolvingAgainstBaseURL: true) else { return }

        switch components.host {
        case "contactdetails":
            if let name = components.queryItems?.first(where: { $0.name == "initials" })?.value,
               let creationDate = components.queryItems?.first(where: { $0.name == "creationDate" })?.value {
                if let contact = ContactsExample.shared.contacts.first(where: { $0.initials == name && $0.creationDate == creationDate }) {
                    print(name, creationDate)
                    print(contact)
                }
            }
        default:
            break
        }
    }
}

#Preview {
    ContentView()
}
