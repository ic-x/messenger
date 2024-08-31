//
//  ContactsExample.swift
//  Messenger
//
//  Created by Clark Adams on 6/25/24.
//

import SwiftUI

final class ContactsExample {
    private init() {}
    static let shared = ContactsExample()
    
    var selected: Int = 0
    let contacts: [Contact] = [
        Contact(
            firstName: "Анастасия",
            lastName: "Иванова",
            phoneNumber: "+7 999 111-11-11",
            socialLinks: [
                SocialLink(name: "X", url: "https://x.com", icon: "TwitterIcon"),
                SocialLink(name: "Instagram", url: "https://instagram.com", icon: "InstagramIcon"),
                SocialLink(name: "LinkedIn", url: "https://linkedin.com", icon: "LinkedInIcon"),
                SocialLink(name: "Facebook", url: "https://facebook.com", icon: "FacebookIcon")
            ],
            status: "offline",
            lastSeen: "Была вчера",
            avatar: "AnastasiaIvanovaAvatar",
            hasStories: false,
            gradientColors: [],
            creationDate: "2024-01-01T00:00:00+0000"
        ),
        Contact(
            firstName: "Петя",
            lastName: nil,
            phoneNumber: "+7 999 222-22-22",
            socialLinks: [
                SocialLink(name: "X", url: "https://x.com", icon: "TwitterIcon"),
                SocialLink(name: "Instagram", url: "https://instagram.com", icon: "InstagramIcon"),
                SocialLink(name: "LinkedIn", url: "https://linkedin.com", icon: "LinkedInIcon"),
                SocialLink(name: "Facebook", url: "https://facebook.com", icon: "FacebookIcon")
            ],
            status: "online",
            lastSeen: nil,
            avatar: "PeterAvatar",
            hasStories: false,
            gradientColors: [],
            creationDate: "2025-01-01T00:00:00+0000"
        ),
        Contact(
            firstName: "Маман",
            lastName: nil,
            phoneNumber: "+7 999 333-33-33",
            socialLinks: [
                SocialLink(name: "X", url: "https://x.com", icon: "TwitterIcon"),
                SocialLink(name: "Instagram", url: "https://instagram.com", icon: "InstagramIcon"),
                SocialLink(name: "LinkedIn", url: "https://linkedin.com", icon: "LinkedInIcon"),
                SocialLink(name: "Facebook", url: "https://facebook.com", icon: "FacebookIcon")
            ],
            status: "offline",
            lastSeen: "Была 3 часа назад",
            avatar: "MamanAvatar",
            hasStories: true,
            gradientColors: [.variant1Color1, .variant1Color2],
            creationDate: "2026-01-01T00:00:00+0000"
        ),
        Contact(
            firstName: "Арбуз",
            lastName: "Дыня",
            phoneNumber: "+7 999 444-44-44",
            socialLinks: [
                SocialLink(name: "X", url: "https://x.com", icon: "TwitterIcon"),
                SocialLink(name: "Instagram", url: "https://instagram.com", icon: "InstagramIcon"),
                SocialLink(name: "LinkedIn", url: "https://linkedin.com", icon: "LinkedInIcon"),
                SocialLink(name: "Facebook", url: "https://facebook.com", icon: "FacebookIcon")
            ],
            status: "online",
            lastSeen: nil,
            avatar: "WatermelonMelonAvatar",
            hasStories: false,
            gradientColors: [],
            creationDate: "2027-01-01T00:00:00+0000"
        ),
        Contact(
            firstName: "Иван",
            lastName: "Иванов",
            phoneNumber: "+7 999 555-55-55",
            socialLinks: [
                SocialLink(name: "X", url: "https://x.com", icon: "TwitterIcon"),
                SocialLink(name: "Instagram", url: "https://instagram.com", icon: "InstagramIcon"),
                SocialLink(name: "LinkedIn", url: "https://linkedin.com", icon: "LinkedInIcon"),
                SocialLink(name: "Facebook", url: "https://facebook.com", icon: "FacebookIcon")
            ],
            status: "online",
            lastSeen: nil,
            avatar: nil,
            hasStories: false,
            gradientColors: [],
            creationDate: "2028-01-01T00:00:00+0000"
        ),
        Contact(
            firstName: "Лиса",
            lastName: "Алиса",
            phoneNumber: "+7 999 666-66-66",
            socialLinks: [
                SocialLink(name: "X", url: "https://x.com", icon: "TwitterIcon"),
                SocialLink(name: "Instagram", url: "https://instagram.com", icon: "InstagramIcon"),
                SocialLink(name: "LinkedIn", url: "https://linkedin.com", icon: "LinkedInIcon"),
                SocialLink(name: "Facebook", url: "https://facebook.com", icon: "FacebookIcon")
            ],
            status: "offline",
            lastSeen: "Была 30 минут назад",
            avatar: nil,
            hasStories: true,
            gradientColors: [.variant2Color1, .variant2Color2],
            creationDate: "2029-01-01T00:00:00+0000"
        )
    ]
}
