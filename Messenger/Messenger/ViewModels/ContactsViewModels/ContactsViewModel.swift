//
//  ContactsViewModel.swift
//  Messenger
//
//  Created by Clark Adams on 6/20/24.
//

import SwiftUI

class ContactsViewModel: ObservableObject {
    @Published var searchText = ""
    @Published var selectedContact: Contact?
    @Published var navigationPath = NavigationPath()
    @Published var contacts: [Contact] = ContactsExample.shared.contacts
    
    var filteredContacts: [Contact] {
        if searchText.isEmpty {
            return contacts
        } else {
            return contacts.filter { $0.firstName.contains(searchText) || ($0.lastName?.contains(searchText) ?? false) }
        }
    }
}
