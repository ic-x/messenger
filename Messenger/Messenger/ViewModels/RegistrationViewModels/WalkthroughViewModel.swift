//
//  WalkthroughViewModel.swift
//  Messenger
//
//  Created by Clark Adams on 6/13/24.
//

import SwiftUI

class WalkthroughViewModel: ObservableObject {
    @Published var showingPrivacyPolicy = false
    @Published var showingTermsOfUse = false
    
    func showPrivacyPolicy() {
        showingPrivacyPolicy = true
    }
    
    func showTermsOfUse() {
        showingTermsOfUse = true
    }
    
    func navigateToVerificationPhoneView(navigationPath: Binding<NavigationPath>) {
        navigationPath.wrappedValue.append(NavigationItem.verificationPhoneView)
    }
}
