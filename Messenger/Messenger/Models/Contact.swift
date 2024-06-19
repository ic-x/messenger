//
//  Contact.swift
//  Messenger
//
//  Created by Clark Adams on 6/18/24.
//

import Foundation

struct Contact: Identifiable, Hashable {
    let id = UUID()
    var firstName: String
    var lastName: String?
    var phoneNumber: String
    var socialLinks: [String: String]
    var status: String
    var lastSeen: String?
}
