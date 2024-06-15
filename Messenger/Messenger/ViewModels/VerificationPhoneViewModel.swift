//
//  VerificationPhoneViewModel.swift
//  Messenger
//
//  Created by Clark Adams on 6/13/24.
//

import SwiftUI

class VerificationPhoneViewModel: ObservableObject {
    @Published var phoneNumber: String = ""
    @Published var selectedCountry: Country
    @Published var isPickerPresented = false
    @Published var searchText = ""
    
    static let countries: [Country] = [
        Country(name: "США", code: "+1", flag: "🇺🇸"),
        Country(name: "Китай", code: "+86", flag: "🇨🇳"),
        Country(name: "Турция", code: "+90", flag: "🇹🇷"),
        Country(name: "Великобритания", code: "+44", flag: "🇬🇧"),
        Country(name: "Южная Корея", code: "+82", flag: "🇰🇷"),
        Country(name: "ОАЭ", code: "+971", flag: "🇦🇪"),
        Country(name: "Россия", code: "+7", flag: "🇷🇺"),
        Country(name: "Казахстан", code: "+7", flag: "🇰🇿"),
        Country(name: "Азербайджан", code: "+994", flag: "🇦🇿"),
        Country(name: "Узбекистан", code: "+998", flag: "🇺🇿"),
        Country(name: "Беларусь", code: "+375", flag: "🇧🇾"),
        Country(name: "Армения", code: "+374", flag: "🇦🇲"),
        Country(name: "Грузия", code: "+995", flag: "🇬🇪"),
        Country(name: "Кыргызстан", code: "+996", flag: "🇰🇬"),
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
        self.selectedCountry = Self.countries[6]
    }
}
