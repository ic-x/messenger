//
//  CountryPickerViewModel.swift
//  Messenger
//
//  Created by Clark Adams on 6/13/24.
//

import SwiftUI
import Combine

class CountryPickerViewModel: ObservableObject {
    @Published var countries: [Country]
    @Published var searchText: String = ""
    
    init(countries: [Country]) {
        self.countries = countries
    }
    
    var filteredCountries: [Country] {
        if searchText.isEmpty {
            return countries
        } else {
            return countries.filter { $0.name.lowercased().contains(searchText.lowercased()) }
        }
    }
}
