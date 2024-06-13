//
//  VerificationCodeViewModel.swift
//  Messenger
//
//  Created by Clark Adams on 6/13/24.
//

import SwiftUI

class VerificationCodeViewModel: ObservableObject {
    @Published var code: String = ""
    @Published var showingAlert = false
    @Published var isCodeCorrect = false
    @Published var isButtonDisabled = false
    @Published var countdownTimer: Timer?
    @Published var remainingSeconds = 0
    
    var phoneNumber: String
    
    private let correctCode = "1234"
    private let cooldownSeconds = 10
    
    init(phoneNumber: String) {
        self.phoneNumber = phoneNumber
    }
    
    func validateCode() {
        if code.count > 4 {
            code = String(code.prefix(4))
        }
        code = code.filter { "0123456789".contains($0) }
        
        if code == correctCode {
            isCodeCorrect = true
        } else if code.count == 4 && code != correctCode {
            showingAlert = true
        }
    }
    
    func resetCode() {
        code = ""
    }
    
    func startCooldown() {
        isButtonDisabled = true
        remainingSeconds = cooldownSeconds
        countdownTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            if self.remainingSeconds > 0 {
                self.remainingSeconds -= 1
            } else {
                self.stopCooldown()
            }
        }
    }
    
    func stopCooldown() {
        countdownTimer?.invalidate()
        countdownTimer = nil
        isButtonDisabled = false
        remainingSeconds = 0
    }
}
