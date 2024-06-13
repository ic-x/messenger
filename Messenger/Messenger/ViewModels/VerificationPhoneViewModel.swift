//
//  VerificationPhoneViewModel.swift
//  Messenger
//
//  Created by Clark Adams on 6/13/24.
//

import SwiftUI
import Combine

class VerificationPhoneViewModel: ObservableObject {
    @Published var phoneNumber: String = ""
    @Published var selectedCountry: Country
    @Published var isPickerPresented = false
    @Published var searchText = ""
    
    static let countries: [Country] = [
        Country(name: "Россия", code: "+7", flag: "🇷🇺"),
        Country(name: "United States", code: "+1", flag: "🇺🇸"),
        Country(name: "United Kingdom", code: "+44", flag: "🇬🇧"),
    ]
    
    var filteredCountries: [Country] {
        if searchText.isEmpty {
            return Self.countries
        } else {
            return Self.countries.filter { $0.name.lowercased().contains(searchText.lowercased()) }
        }
    }
    
    var isPhoneNumberValid: Bool {
        return phoneNumber.filter { "0123456789".contains($0) }.count == 10
    }
    
    func formatPhoneNumber(_ number: String) -> String {
        let cleanedNumber = number.filter { "0123456789".contains($0) }
        var formattedNumber = ""
        
        let length = cleanedNumber.count
        
        if length > 0 {
            formattedNumber += String(cleanedNumber.prefix(3))
        }
        if length > 3 {
            let start = cleanedNumber.index(cleanedNumber.startIndex, offsetBy: 3)
            let end = cleanedNumber.index(cleanedNumber.startIndex, offsetBy: min(6, length))
            formattedNumber += " " + cleanedNumber[start..<end]
        }
        if length > 6 {
            let start = cleanedNumber.index(cleanedNumber.startIndex, offsetBy: 6)
            let end = cleanedNumber.index(cleanedNumber.startIndex, offsetBy: min(8, length))
            formattedNumber += "-" + cleanedNumber[start..<end]
        }
        if length > 8 {
            let start = cleanedNumber.index(cleanedNumber.startIndex, offsetBy: 8)
            let end = cleanedNumber.index(cleanedNumber.startIndex, offsetBy: min(10, length))
            formattedNumber += "-" + cleanedNumber[start..<end]
        }
        
        return formattedNumber
    }
    
    init() {
        self.selectedCountry = Self.countries[0]
    }
}
