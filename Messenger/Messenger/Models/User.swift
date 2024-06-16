//
//  User.swift
//  Messenger
//
//  Created by Clark Adams on 6/13/24.
//

import Foundation

enum UserError: Error, LocalizedError {
    case saveError(Error)
    case loadError(Error)
    
    var errorDescription: String? {
        switch self {
        case .saveError(let error):
            return "Failed to save user: \(error.localizedDescription)"
        case .loadError(let error):
            return "Failed to load user: \(error.localizedDescription)"
        }
    }
}

struct User: Identifiable, Codable {
    let id: UUID
    var firstName: String
    var lastName: String?
    var phoneNumber: String
    
    init(id: UUID = UUID(), firstName: String, lastName: String? = nil, phoneNumber: String) {
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.phoneNumber = phoneNumber
    }
    
    static let userDefaultsKey = "savedUser"
    
    func saveToUserDefaults() throws {
        do {
            let encoded = try JSONEncoder().encode(self)
            UserDefaults.standard.set(encoded, forKey: User.userDefaultsKey)
        } catch {
            throw UserError.saveError(error)
        }
    }
    
    static func loadFromUserDefaults() throws -> User? {
        do {
            if let savedUserData = UserDefaults.standard.data(forKey: User.userDefaultsKey) {
                let user = try JSONDecoder().decode(User.self, from: savedUserData)
                return user
            }
        } catch {
            throw UserError.loadError(error)
        }
        return nil
    }
}
