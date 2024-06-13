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
                .font(.title)
                .bold()
                .padding()
            
            Text("Отправили код на номер \(viewModel.phoneNumber)")
                .padding()
            
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
                } message: {
                    Text("Неправильный код подтверждения")
                }
            
            Button(action: {
                viewModel.resetCode()
                viewModel.startCooldown()
            }) {
                Text("Запросить код повторно")
                    .bold()
                    .padding()
            }
            .disabled(viewModel.isButtonDisabled)
            
            VStack {
                Spacer()
                
                if viewModel.isButtonDisabled {
                    Text("Повторный запрос через \(viewModel.remainingSeconds) сек")
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
