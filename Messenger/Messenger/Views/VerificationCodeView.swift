//
//  VerificationCodeView.swift
//  Messenger
//
//  Created by Clark Adams on 6/12/24.
//

import SwiftUI

struct VerificationCodeView: View {
    @Binding var navigationPath: NavigationPath
    @ObservedObject var viewModel: VerificationCodeViewModel
    
    var body: some View {
        VStack {
            Text("Введите код")
                .font(.Typography.Heading.h2)
                .multilineTextAlignment(.center)
                .padding()
                .foregroundStyle(.text)
            
            Text("Отправили код на номер \(viewModel.phoneNumber)")
                .font(.Typography.Body.body2)
                .lineSpacing(24)
                .multilineTextAlignment(.center)
                .padding()
                .foregroundStyle(.text)
            
            TextField("Код подтверждения", text: $viewModel.code)
                .keyboardType(.numberPad)
                .padding()
                .onChange(of: viewModel.code) { oldValue, newValue in
                    viewModel.validateCode()
                }
                .alert("Ошибка", isPresented: $viewModel.showingAlert) {
                    Button("OK") {
                        viewModel.showingAlert = false
                    }
                    .font(.Typography.Body.body2)
                } message: {
                    Text("Неправильный код подтверждения")
                        .font(.Typography.Body.body1)
                }
                .font(.Typography.Heading.h1)
                .multilineTextAlignment(.center)
            
            Button(action: {
                viewModel.resetCode()
                viewModel.startCooldown()
            }) {
                Text("Запросить код повторно")
                    .font(.Typography.Subheading.sub2)
                    .lineSpacing(28)
                    .multilineTextAlignment(.center)
                    .padding()
            }
            .disabled(viewModel.isButtonDisabled)
            
            VStack {
                Spacer()
                
                if viewModel.isButtonDisabled {
                    Text("Повторный запрос через \(viewModel.remainingSeconds) сек")
                        .font(.Typography.Metadata.metadata1)
                        .lineSpacing(16)
                        .multilineTextAlignment(.center)
                        .foregroundStyle(.gray)
                        .padding(.top, 10)
                }
            }
        }
        .navigationTitle("")
        .onChange(of: viewModel.isCodeCorrect) { oldValue, newValue in
            if newValue {
                navigationPath.append(NavigationItem.profileAccountView(phoneNumber: viewModel.phoneNumber))
                viewModel.isCodeCorrect = false
            }
        }
    }
}

#Preview {
    VerificationCodeView(navigationPath: .constant(NavigationPath()), viewModel: VerificationCodeViewModel(phoneNumber: "+7 999 999-99-99"))
}
