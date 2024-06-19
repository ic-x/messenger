//
//  ContactsView.swift
//  Messenger
//
//  Created by Clark Adams on 6/17/24.
//

import SwiftUI

struct ContactsView: View {
    @State private var searchText = ""
    @State private var selectedContact: Contact?
    @State private var navigationPath = NavigationPath()
    
    @State private var contacts: [Contact] = [
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
            gradientColors: []
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
            gradientColors: []
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
            gradientColors: [Color.variant1Color1, Color.variant1Color2]
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
            gradientColors: []
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
            gradientColors: []
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
            gradientColors: [Color.variant2Color1, Color.variant2Color2]
        ),
    ]
    
    var body: some View {
        NavigationStack(path: $navigationPath) {
            ZStack {
                Color.brandBackground
                    .ignoresSafeArea()
                VStack {
                    HStack {
                        RoundedRectangle(cornerRadius: 4)
                            .fill(.inputField)
                            .frame(height: 36)
                            .overlay(
                                HStack {
                                    Image(.searchIcon)
                                    TextField("Поиск", text: $searchText)
                                        .font(.Typography.Body.body1)
                                }
                                .padding(.horizontal, 10)
                            )
                    }
                    .padding(.leading)
                    .padding(.top, 23)
                    
                    List {
                        ForEach(filteredContacts) { contact in
                            ContactRowView(contact: contact)
                                .onTapGesture {
                                    navigationPath.append(contact)
                                }
                        }
                        .listRowBackground(Color.brandBackground)
                    }
                    .listStyle(PlainListStyle())
                    .background(Color.brandBackground)
                    .navigationDestination(for: Contact.self) { contact in
                        if let index = contacts.firstIndex(where: { $0.id == contact.id }) {
                            ContactDetailsView(navigationPath: $navigationPath, contact: $contacts[index])
                        }
                    }
                }
                .padding(.leading, 5)
                .padding(.trailing, 30)
                .toolbar {
                    ToolbarItemGroup(placement: .topBarLeading) {
                        Text("Контакты")
                            .font(.Typography.Subheading.sub1)
                            .lineSpacing(30)
                            .foregroundStyle(.text)
                    }
                    
                    ToolbarItem(placement: .topBarTrailing) {
                        Button(action: {
                            logMessage("Новый контакт")
                        }) {
                            Image("NewContactIcon")
                        }
                    }
                }
                .navigationBarBackButtonHidden(true)
            }
            .background(Color.brandBackground)
        }
        .background(Color.brandBackground)
    }
    
    var filteredContacts: [Contact] {
        if searchText.isEmpty {
            return contacts
        } else {
            return contacts.filter { $0.firstName.contains(searchText) || ($0.lastName?.contains(searchText) ?? false) }
        }
    }
}

#Preview {
    ContactsView()
}
