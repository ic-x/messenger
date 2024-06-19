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
    @FocusState private var isTextFieldFocused: Bool
    
    var body: some View {
        ZStack {
            Color.brandBackground
                .ignoresSafeArea()
            VStack {
                Text("Введите код")
                    .font(.Typography.Heading.h2)
                    .multilineTextAlignment(.center)
                    .padding()
                    .foregroundStyle(.text)
                    .padding(.top, 200)
                
                Text("Отправили код на номер \(viewModel.phoneNumber)")
                    .font(.Typography.Body.body2)
                    .lineSpacing(24)
                    .multilineTextAlignment(.center)
                    .padding(.bottom)
                    .padding(.bottom)
                    .foregroundStyle(.text)
                
                Text("CURRENT CODE 1234")
                    .font(.caption2)
                    .multilineTextAlignment(.center)
                    .padding(3)
                    .background(
                        RoundedRectangle(cornerRadius: 5)
                            .fill(.disclaimer)
                    )
                    .padding(.bottom)
                    .foregroundStyle(.warning)
                
                HStack(spacing: 10) {
                    ForEach(0..<4, id: \.self) { index in
                        let digit = viewModel.code.count > index ? String(viewModel.code[viewModel.code.index(viewModel.code.startIndex, offsetBy: index)]) : ""
                        CodeDigitView(digit: digit)
                    }
                }
                .padding()
                .onTapGesture {
                    isTextFieldFocused = true
                }
                
                TextField("", text: $viewModel.code)
                    .keyboardType(.numberPad)
                    .textContentType(.oneTimeCode)
                    .foregroundStyle(.clear)
                    .accentColor(.clear)
                    .frame(width: 1, height: 1)
                    .focused($isTextFieldFocused)
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
                    .onAppear {
                        isTextFieldFocused = true
                    }
                
                VStack {
                    if viewModel.isButtonDisabled {
                        Text("Повторный запрос через \(viewModel.remainingSeconds) сек")
                            .font(.Typography.Metadata.metadata1)
                            .lineSpacing(16)
                            .multilineTextAlignment(.center)
                            .foregroundStyle(.gray)
                            .padding(.top, 10)
                    }
                }
                
                Spacer()
                
                Button(action: {
                    viewModel.resetCode()
                    viewModel.startCooldown()
                }) {
                    Text("Запросить код повторно")
                        .font(.Typography.Subheading.sub2)
                        .lineSpacing(28)
                        .multilineTextAlignment(.center)
                        .foregroundStyle(.textButton)
                        .padding()
                }
                .disabled(viewModel.isButtonDisabled)
                .padding(.bottom, 250)
            }
            .onChange(of: viewModel.isCodeCorrect) { oldValue, newValue in
                if newValue {
                    navigationPath.append(NavigationItem.profileAccountView(phoneNumber: viewModel.phoneNumber))
                    viewModel.isCodeCorrect = false
                }
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
    VerificationCodeView(navigationPath: .constant(NavigationPath()), viewModel: VerificationCodeViewModel(phoneNumber: "+7 999 999-99-99"))
}
