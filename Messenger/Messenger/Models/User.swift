//
//  User.swift
//  Messenger
//
//  Created by Clark Adams on 6/13/24.
//

import Foundation

struct User: Identifiable {
    let id: UUID
    var firstName: String
    var lastName: String?
    var phoneNumber: String
    
    init(id: UUID = UUID(), firstName: String, lastName: String? = nil, phoneNumber: String) {
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.phoneNumber = phoneNumber
    }
}
