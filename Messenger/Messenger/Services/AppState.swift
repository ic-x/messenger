//
//  AppState.swift
//  Messenger
//
//  Created by Clark Adams on 6/19/24.
//

import SwiftUI

class AppState: ObservableObject {
    @Published var currentView: AppView = .walkthrough
    @Published var isRegistered: Bool = true
    
    init() {
        checkRegistrationStatus()
    }
    
    func checkRegistrationStatus() {
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
