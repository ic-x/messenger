//
//  CountryPickerViewModel.swift
//  Messenger
//
//  Created by Clark Adams on 6/13/24.
//

import SwiftUI

class CountryPickerViewModel: ObservableObject {
    @Published var searchText: String = ""
    @Published var countries: [Country]
    
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
