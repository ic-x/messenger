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
                        .padding()
                        .foregroundStyle(.brandPlaceholder)
                        .background(Color(.inputField))
                        .clipShape(RoundedRectangle(cornerRadius: 5))
                }
                .padding()
                
                List(viewModel.filteredCountries) { country in
                    Button(action: {
                        selectedCountry = country
                        isPresented = false
                    }) {
                        HStack {
                            Image(country.flagImageName)
                                .resizable()
                                .frame(width: 18, height: 12)
                            
                            Text(country.name)
                                .font(.Typography.Body.body2)
                            
                            Spacer()
                            
                            Text(country.code)
                                .font(.Typography.Body.body1)
                        }
                    }
                }
                .foregroundStyle(.text)
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Text("Выберите страну")
                        .font(.Typography.Subheading.sub1)
                        .foregroundStyle(.text)
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Отмена") {
                        isPresented = false
                    }
                    .font(.Typography.Subheading.sub1)
                    .foregroundStyle(.textButton)
                }
            }
        }
    }
}

#Preview {
    @State var selectedCountry = Country(name: "Россия", code: "+7", flagImageName: "RU")
    @State var isPresented = true
    @State var searchText = ""
    
    let viewModel = CountryPickerViewModel(countries: [
        Country(name: "США", code: "+1", flagImageName: "US"),
        Country(name: "Китай", code: "+86", flagImageName: "CN"),
        Country(name: "Турция", code: "+90", flagImageName: "TR"),
        Country(name: "Великобритания", code: "+44", flagImageName: "GB"),
        Country(name: "Южная Корея", code: "+82", flagImageName: "KR"),
        Country(name: "ОАЭ", code: "+971", flagImageName: "AE"),
        Country(name: "Россия", code: "+7", flagImageName: "RU"),
        Country(name: "Казахстан", code: "+7", flagImageName: "KZ"),
        Country(name: "Азербайджан", code: "+994", flagImageName: "AZ"),
        Country(name: "Узбекистан", code: "+998", flagImageName: "UZ"),
        Country(name: "Беларусь", code: "+375", flagImageName: "BY"),
        Country(name: "Армения", code: "+374", flagImageName: "AM"),
        Country(name: "Грузия", code: "+995", flagImageName: "GE"),
        Country(name: "Кыргызстан", code: "+996", flagImageName: "KG"),
    ])
    
    return CountryPickerView(
        selectedCountry: $selectedCountry,
        isPresented: $isPresented,
        searchText: $searchText,
        viewModel: viewModel
    )
}
