//
//  ContactsView.swift
//  Messenger
//
//  Created by Clark Adams on 6/17/24.
//

import SwiftUI

struct ContactRow: View {
    var contact: Contact
    
    var body: some View {
        HStack {
            ZStack(alignment: .topTrailing) {
                Image(systemName: contact.avatar)
                    .resizable()
                    .frame(width: 40, height: 40)
                
                if contact.status == "online" {
                    Circle()
                        .fill(Color.green)
                        .frame(width: 10, height: 10)
                        .offset(x: 5, y: -5)
                }
            }
            
            VStack(alignment: .leading) {
                Text("\(contact.firstName) \(contact.lastName ?? "")")
                    .font(.headline)
                
                if contact.status == "online" {
                    Text("Онлайн")
                        .font(.subheadline)
                        .foregroundColor(.green)
                } else if let lastSeen = contact.lastSeen {
                    Text(lastSeen)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }
            
            Spacer()
        }
    }
}

struct SearchBar: View {
    @Binding var text: String
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
            TextField("Поиск", text: $text)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }
        .padding()
    }
}

struct ContactsView: View {
    @Binding var selectedTab: Tab
    
    @State private var searchText = ""
    @State private var selectedContact: Contact?
    @State private var navigationPath = NavigationPath()
    
    @State private var contacts: [Contact] = [
        Contact(
            firstName: "Анастасия",
            lastName: "Иванова",
            phoneNumber: "+7 999 111-11-11",
            socialLinks: [
                SocialLink(name: "X", url: "https://x.com", icon: "xmark.circle"),
                SocialLink(name: "Instagram", url: "https://instagram.com", icon: "camera"),
                SocialLink(name: "LinkedIn", url: "https://linkedin.com", icon: "link.circle"),
                SocialLink(name: "Facebook", url: "https://facebook.com", icon: "f.circle")
            ],
            status: "offline",
            lastSeen: "Была вчера",
            avatar: "person.crop.circle.fill"
        ),
        Contact(
            firstName: "Петя",
            lastName: nil,
            phoneNumber: "+7 999 222-22-22",
            socialLinks: [
                SocialLink(name: "X", url: "https://x.com", icon: "xmark.circle"),
                SocialLink(name: "Instagram", url: "https://instagram.com", icon: "camera"),
                SocialLink(name: "LinkedIn", url: "https://linkedin.com", icon: "link.circle"),
                SocialLink(name: "Facebook", url: "https://facebook.com", icon: "f.circle")
            ],
            status: "online",
            lastSeen: nil,
            avatar: "person.crop.circle.fill"
        ),
        Contact(
            firstName: "Маман",
            lastName: nil,
            phoneNumber: "+7 999 333-33-33",
            socialLinks: [
                SocialLink(name: "X", url: "https://x.com", icon: "xmark.circle"),
                SocialLink(name: "Instagram", url: "https://instagram.com", icon: "camera"),
                SocialLink(name: "LinkedIn", url: "https://linkedin.com", icon: "link.circle"),
                SocialLink(name: "Facebook", url: "https://facebook.com", icon: "f.circle")
            ],
            status: "offline",
            lastSeen: "Была 3 часа назад",
            avatar: "person.crop.circle.fill"
        ),
        Contact(
            firstName: "Арбуз",
            lastName: "Дыня",
            phoneNumber: "+7 999 444-44-44",
            socialLinks: [
                SocialLink(name: "X", url: "https://x.com", icon: "xmark.circle"),
                SocialLink(name: "Instagram", url: "https://instagram.com", icon: "camera"),
                SocialLink(name: "LinkedIn", url: "https://linkedin.com", icon: "link.circle"),
                SocialLink(name: "Facebook", url: "https://facebook.com", icon: "f.circle")
            ],
            status: "online",
            lastSeen: nil,
            avatar: "person.crop.circle.fill"
        ),
        Contact(
            firstName: "Иван",
            lastName: "Иванов",
            phoneNumber: "+7 999 555-55-55",
            socialLinks: [
                SocialLink(name: "X", url: "https://x.com", icon: "xmark.circle"),
                SocialLink(name: "Instagram", url: "https://instagram.com", icon: "camera"),
                SocialLink(name: "LinkedIn", url: "https://linkedin.com", icon: "link.circle"),
                SocialLink(name: "Facebook", url: "https://facebook.com", icon: "f.circle")
            ],
            status: "online",
            lastSeen: nil,
            avatar: "person.crop.circle.fill"
        ),
        Contact(
            firstName: "Лиса",
            lastName: "Алиса",
            phoneNumber: "+7 999 666-66-66",
            socialLinks: [
                SocialLink(name: "X", url: "https://x.com", icon: "xmark.circle"),
                SocialLink(name: "Instagram", url: "https://instagram.com", icon: "camera"),
                SocialLink(name: "LinkedIn", url: "https://linkedin.com", icon: "link.circle"),
                SocialLink(name: "Facebook", url: "https://facebook.com", icon: "f.circle")
            ],
            status: "offline",
            lastSeen: "Была 30 минут назад",
            avatar: "person.crop.circle.fill"
        )
    ]
    
    var body: some View {
        NavigationStack(path: $navigationPath) {
            List {
                SearchBar(text: $searchText)
                
                ForEach(filteredContacts) { contact in
                    ContactRow(contact: contact)
                        .onTapGesture {
                            navigationPath.append(contact)
                        }
                }
            }
            .navigationTitle("Контакты")
            .navigationDestination(for: Contact.self) { contact in
                if let index = contacts.firstIndex(where: { $0.id == contact.id }) {
                    ContactDetailsView(navigationPath: $navigationPath, contact: $contacts[index])
                }
            }
        }
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
    ContactsView(selectedTab: .constant(.contacts))
}
