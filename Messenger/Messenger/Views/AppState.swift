//
//  AppState.swift
//  Messenger
//
//  Created by Clark Adams on 6/19/24.
//

import SwiftUI

class AppState: ObservableObject {
    @Published var currentView: AppView = .walkthrough
    @Published var isRegistered: Bool = false
    
    init() {
        checkRegistrationStatus()
    }
    
    func checkRegistrationStatus() {
        isRegistered = false
        currentView = isRegistered ? .main : .walkthrough
    }
    
    func registerUser() {
        isRegistered = true
        currentView = .main
    }
}

enum AppView {
    case walkthrough
    case main
}
