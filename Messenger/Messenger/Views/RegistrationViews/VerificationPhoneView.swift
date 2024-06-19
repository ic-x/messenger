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
        ZStack {
            Color.brandBackground
                .ignoresSafeArea()
            VStack {
                Text("Введите номер телефона")
                    .font(.Typography.Heading.h2)
                    .multilineTextAlignment(.center)
                    .padding()
                    .foregroundStyle(.text)
                
                Text("Мы вышлем код подтверждения на указанный номер")
                    .font(.Typography.Body.body2)
                    .lineSpacing(24)
                    .multilineTextAlignment(.center)
                    .padding(.bottom)
                    .foregroundStyle(.text)
                
                HStack {
                    Button(action: {
                        viewModel.isPickerPresented.toggle()
                    }) {
                        HStack {
                            Image(viewModel.selectedCountry.flagImageName)
                                .resizable()
                                .frame(width: 18, height: 12)
                            Text(viewModel.selectedCountry.code)
                        }
                        .padding()
                    }
                    .sheet(isPresented: $viewModel.isPickerPresented) {
                        CountryPickerView(
                            selectedCountry: $viewModel.selectedCountry,
                            isPresented: $viewModel.isPickerPresented,
                            searchText: $viewModel.searchText,
                            viewModel: CountryPickerViewModel(countries: viewModel.filteredCountries)
                        )
                    }
                    
                    ZStack(alignment: .leading) {
                        Text("000 000-00-00")
                            .foregroundStyle(.brandPlaceholder)
                            .opacity(viewModel.phoneNumber.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.phoneNumber)
                            .keyboardType(.phonePad)
                            .onChange(of: viewModel.phoneNumber) { oldValue, newValue in
                                viewModel.phoneNumber = viewModel.formatPhoneNumber(String(newValue.filter { "0123456789".contains($0) }))
                            }
                    }
                }
                .background(
                    RoundedRectangle(cornerRadius: 4)
                        .fill(.inputField)
                )
                .font(.Typography.Body.body1)
                .lineSpacing(24)
                .foregroundStyle(.text)
                .padding()
                .padding()
                .padding(.bottom)
                
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
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {
                        if !navigationPath.isEmpty {
                            navigationPath.removeLast()
                        }
                    }) {
                        Image("ChevronLeft")
                    }
                }
            }
            .navigationBarBackButtonHidden(true)
        }
    }
}

#Preview {
    VerificationPhoneView(navigationPath: .constant(NavigationPath()))
}
