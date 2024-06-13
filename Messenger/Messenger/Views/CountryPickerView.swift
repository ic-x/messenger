//
//  CountryPickerView.swift
//  Messenger
//
//  Created by Clark Adams on 6/12/24.
//

import SwiftUI

struct CountryPickerView: View {
    @Binding var selectedCountry: Country
    @Binding var isPresented: Bool
    @Binding var searchText: String
    @ObservedObject var viewModel: CountryPickerViewModel
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    TextField("Поиск страны", text: $searchText)
                        .padding(10)
                        .background(Color(.systemGray6))
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                }
                .padding()
                
                List(viewModel.filteredCountries) { country in
                    Button(action: {
                        selectedCountry = country
                        isPresented = false
                    }) {
                        HStack {
                            Text(country.flag)
                            Text(country.name)
                            Spacer()
                            Text(country.code)
                        }
                    }
                }
            }
            .navigationTitle("Выберите страну")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Отмена") {
                        isPresented = false
                    }
                }
            }
        }
    }
}

#Preview {
    @State var selectedCountry = Country(name: "Россия", code: "+7", flag: "🇷🇺")
    @State var isPresented = true
    @State var searchText = ""
    
    let viewModel = CountryPickerViewModel(countries: [
        Country(name: "Россия", code: "+7", flag: "🇷🇺"),
        Country(name: "United States", code: "+1", flag: "🇺🇸"),
        Country(name: "United Kingdom", code: "+44", flag: "🇬🇧")
    ])
    
    return CountryPickerView(
        selectedCountry: $selectedCountry,
        isPresented: $isPresented,
        searchText: $searchText,
        viewModel: viewModel
    )
}
