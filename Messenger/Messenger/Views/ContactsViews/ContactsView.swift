//
//  ContactsView.swift
//  Messenger
//
//  Created by Clark Adams on 6/17/24.
//

import SwiftUI

struct ContactsView: View {
    @Binding var selectedTab: Tab
    
    @State private var searchText = ""
    @State private var selectedContact: Contact?
    @State private var navigationPath = NavigationPath()
    
    let contacts: [Contact] = [
        Contact(firstName: "Анастасия", lastName: "Иванова", phoneNumber: "+7 999 111-11-11", socialLinks: ["X": "https://x.com"], status: "offline", lastSeen: "Была вчера"),
        Contact(firstName: "Петя", lastName: nil, phoneNumber: "+7 999 222-22-22", socialLinks: ["inst": "https://instagram.com"], status: "online", lastSeen: nil),
        Contact(firstName: "Маман", lastName: nil, phoneNumber: "+7 999 333-33-33", socialLinks: ["linkedin": "https://linkedin.com"], status: "offline", lastSeen: "Была 3 часа назад"),
        Contact(firstName: "Арбуз", lastName: "Дыня", phoneNumber: "+7 999 444-44-44", socialLinks: ["facebook": "https://facebook.com"], status: "online", lastSeen: nil),
        Contact(firstName: "Иван", lastName: "Иванов", phoneNumber: "+7 999 555-55-55", socialLinks: ["X": "https://x.com"], status: "online", lastSeen: nil),
        Contact(firstName: "Лиса", lastName: "Алиса", phoneNumber: "+7 999 666-66-66", socialLinks: ["inst": "https://instagram.com"], status: "offline", lastSeen: "Была 30 минут назад")
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
                ContactDetailsView(navigationPath: $navigationPath, contact: contact)
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

//#Preview {
//    @State var selectedTab = Tab.contacts
//    return ContactsView(selectedTab: $selectedTab)
//}
