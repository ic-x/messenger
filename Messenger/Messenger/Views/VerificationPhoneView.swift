//
//  VerificationPhoneView.swift
//  Messenger
//
//  Created by Clark Adams on 6/12/24.
//

import SwiftUI

struct VerificationPhoneView: View {
    @Binding var navigationPath: NavigationPath
    @StateObject private var viewModel = VerificationPhoneViewModel()
    
    var body: some View {
        VStack {
            Text("Введите номер телефона")
                .font(.Typography.Heading.h2)
                .multilineTextAlignment(.center)
                .padding()
            
            Text("Мы вышлем код подтверждения на указанный номер")
                .font(.Typography.Body.body2)
                .lineSpacing(24)
                .multilineTextAlignment(.center)
                .padding()
            
            HStack {
                Button(action: {
                    viewModel.isPickerPresented.toggle()
                }) {
                    HStack {
                        Text("\(viewModel.selectedCountry.flag) \(viewModel.selectedCountry.code)")
                            .foregroundStyle(.primary)
                    }
                }
                .sheet(isPresented: $viewModel.isPickerPresented) {
                    CountryPickerView(
                        selectedCountry: $viewModel.selectedCountry,
                        isPresented: $viewModel.isPickerPresented,
                        searchText: $viewModel.searchText,
                        viewModel: CountryPickerViewModel(countries: viewModel.filteredCountries)
                    )
                }
                .font(.Typography.Body.body1)
                .lineSpacing(24)
                TextField("000 000-00-00", text: $viewModel.phoneNumber)
                    .keyboardType(.phonePad)
                    .onChange(of: viewModel.phoneNumber) { oldValue, newValue in
                        viewModel.phoneNumber = viewModel.formatPhoneNumber(String(newValue.filter { "0123456789".contains($0) }))
                    }
                    .font(.Typography.Body.body1)
                    .lineSpacing(24)
            }
            .padding()
            
            Button(action: {
                let formattedPhoneNumber = "\(viewModel.selectedCountry.code) \(viewModel.phoneNumber)"
                navigationPath.append(NavigationItem.verificationCodeView(phoneNumber: formattedPhoneNumber))
            }) {
                Text("Продолжить")
                    .font(.Typography.Subheading.sub2)
                    .lineSpacing(28)
                    .multilineTextAlignment(.center)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .foregroundStyle(.buttonText)
                    .background(viewModel.isPhoneNumberValid ? .button : .inactiveButton)
                    .cornerRadius(30)
            }
            .disabled(!viewModel.isPhoneNumberValid)
            .padding(.horizontal, 40)
            .padding()
        }
        .navigationTitle("")
    }
}

#Preview {
    VerificationPhoneView(navigationPath: .constant(NavigationPath()))
}
