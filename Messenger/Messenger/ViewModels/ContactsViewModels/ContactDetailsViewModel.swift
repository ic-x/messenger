//
//  ContactDetailsViewModel.swift
//  Messenger
//
//  Created by Clark Adams on 6/20/24.
//

import SwiftUI

class ContactDetailsViewModel: ObservableObject {
    @Binding var navigationPath: NavigationPath
    @Binding var contact: Contact
    
    init(navigationPath: Binding<NavigationPath>, contact: Binding<Contact>) {
        self._navigationPath = navigationPath
        self._contact = contact
    }
    
    var initials: String {
        let firstInitial = contact.firstName.first ?? "?"
        if let lastName = contact.lastName {
            let lastInitial = lastName.first ?? "?"
            return "\(firstInitial)\(lastInitial)"
        } else {
            return "\(firstInitial)"
        }
    }
}
