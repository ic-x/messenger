//
//  Contact.swift
//  Messenger
//
//  Created by Clark Adams on 6/18/24.
//

import Foundation
import SwiftUI

struct Contact: Identifiable, Hashable {
    let id = UUID()
    var firstName: String
    var lastName: String?
    var phoneNumber: String
    var socialLinks: [SocialLink]
    var status: String
    var lastSeen: String?
    var avatar: String?
    var hasStories: Bool
    var gradientColors: [Color]
    var creationDate: String = ""
    
    var fullName: String {
        if let lastName = lastName {
            return "\(firstName) \(lastName)"
        }
        return firstName
    }
    
    var initials: String {
        let firstInitial = firstName.first.map { String($0) } ?? ""
        let lastInitial = lastName?.first.map { String($0) } ?? ""
        return firstInitial + lastInitial
    }
}

struct SocialLink: Identifiable, Hashable {
    let id = UUID()
    var name: String
    var url: String
    var icon: String
}
