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
                        .font(.Typography.Body.body1)
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
                        .font(.Typography.Body.body1)
                        .lineSpacing(24)
                    }
                }
                .foregroundStyle(.text)
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Text("Выберите страну")
                        .font(.Typography.Heading.h2)
                        .foregroundStyle(.text)
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Отмена") {
                        isPresented = false
                    }
                    .font(.Typography.Subheading.sub2)
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
