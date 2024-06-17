//
//  NavigationItem.swift
//  Messenger
//
//  Created by Clark Adams on 6/13/24.
//

import Foundation

enum NavigationItem: Hashable {
    case verificationPhoneView
    case verificationCodeView(phoneNumber: String)
    case profileAccountView(phoneNumber: String)
    case mainView
}
