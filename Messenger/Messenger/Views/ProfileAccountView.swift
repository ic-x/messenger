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
            TextField("Имя (обязательно)", text: $viewModel.firstName)
                .border(!viewModel.firstName.isEmpty && !viewModel.isNameValid(viewModel.firstName) ? Color.red : Color.clear)
                .font(.Typography.Body.body1)
                .lineSpacing(24)
            
            TextField("Фамилия (опционально)", text: $viewModel.lastName)
                .border(!viewModel.lastName.isEmpty && !viewModel.isNameValid(viewModel.lastName) ? Color.red : Color.clear)
                .font(.Typography.Body.body1)
                .lineSpacing(24)
            
            Button(action: {
                viewModel.saveUser()
            }) {
                Text("Сохранить")
                    .font(.Typography.Subheading.sub2)
                    .lineSpacing(28)
                    .multilineTextAlignment(.center)
            }
            .disabled(viewModel.isSaveButtonDisabled)
        }
        .padding()
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Text("Профиль")
                    .font(.Typography.Subheading.sub1)
                    .lineSpacing(30)
            }
        }
    }
}

#Preview {
    ProfileAccountView(navigationPath: .constant(NavigationPath()), viewModel: ProfileAccountViewModel(phoneNumber: "+7 999 999-99-99"))
}
