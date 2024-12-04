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
}

struct SocialLink: Identifiable, Hashable {
    let id = UUID()
    var name: String
    var url: String
    var icon: String
}
