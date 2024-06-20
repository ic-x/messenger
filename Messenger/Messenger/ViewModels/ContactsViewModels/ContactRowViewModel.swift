//
//  ContactRowViewModel.swift
//  Messenger
//
//  Created by Clark Adams on 6/20/24.
//

import SwiftUI

class ContactRowViewModel: ObservableObject {
    var contact: Contact
    
    init(contact: Contact) {
        self.contact = contact
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
