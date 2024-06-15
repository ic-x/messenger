//
//  ProfileAccountViewModel.swift
//  Messenger
//
//  Created by Clark Adams on 6/13/24.
//

import Foundation

class ProfileAccountViewModel: ObservableObject {
    @Published var firstName: String = ""
    @Published var lastName: String = ""
    var phoneNumber: String
    
    init(phoneNumber: String) {
        self.phoneNumber = phoneNumber
    }
    
    func isNameValid(_ name: String) -> Bool {
        let nameRegex = "^[a-zA-Zа-яА-Я]+(\\s[a-zA-Zа-яА-Я]+)*$"
        let nameTest = NSPredicate(format: "SELF MATCHES %@", nameRegex)
        return nameTest.evaluate(with: name)
    }
    
    func saveUser() {
        let newUser = User(firstName: firstName, lastName: lastName, phoneNumber: phoneNumber)
        print(newUser)
    }
    
    var isSaveButtonDisabled: Bool {
        firstName.isEmpty || !isNameValid(firstName) || (!isNameValid(lastName) && !lastName.isEmpty)
    }
}
