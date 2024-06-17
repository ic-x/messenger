//
//  ProfileAccountView.swift
//  Messenger
//
//  Created by Clark Adams on 6/13/24.
//

import SwiftUI

struct ProfileAccountView: View {
    @Binding var navigationPath: NavigationPath
    @ObservedObject var viewModel: ProfileAccountViewModel
    
    var body: some View {
        VStack {
            Image("ChangeAvatar")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
                .padding(.bottom, 20)
            
            TextField("Имя (обязательно)", text: $viewModel.firstName)
                .font(.Typography.Body.body1)
                .padding(12)
                .background(
                    RoundedRectangle(cornerRadius: 4)
                        .fill(.inputField)
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 4)
                        .stroke(viewModel.firstName.isEmpty || viewModel.isNameValid(viewModel.firstName) ? .inputField : .danger, lineWidth: 1)
                )
                .padding(.horizontal, 20)
            
            TextField("Фамилия (опционально)", text: $viewModel.lastName)
                .font(.Typography.Body.body1)
                .padding(12)
                .background(
                    RoundedRectangle(cornerRadius: 4)
                        .fill(.inputField)
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 4)
                        .stroke(viewModel.lastName.isEmpty || viewModel.isNameValid(viewModel.lastName) ? .inputField : .danger, lineWidth: 1)
                )
                .padding(.horizontal, 20)
                .padding(.top, 8)
            
            Button(action: {
                viewModel.saveUser()
                navigationPath.removeLast(navigationPath.count)
                navigationPath.append(NavigationItem.mainView)
            }) {
                Text("Сохранить")
                    .font(.Typography.Subheading.sub2)
                    .lineSpacing(28)
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .foregroundStyle(.buttonText)
                    .background(viewModel.isSaveButtonDisabled ? .inactiveButton : .button)
                    .cornerRadius(30)
            }
            .disabled(viewModel.isSaveButtonDisabled)
            .padding(.horizontal, 40)
            .padding(.top, 40)
        }
        .padding()
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                HStack{
                    Button(action: {
                        if !navigationPath.isEmpty {
                            navigationPath.removeLast()
                        }
                    }) {
                        Image("ChevronLeft")
                    }
                    Text("Профиль")
                        .font(.Typography.Subheading.sub1)
                        .lineSpacing(30)
                        .foregroundStyle(.text)
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    ProfileAccountView(navigationPath: .constant(NavigationPath()), viewModel: ProfileAccountViewModel(phoneNumber: "+7 999 999-99-99"))
}
