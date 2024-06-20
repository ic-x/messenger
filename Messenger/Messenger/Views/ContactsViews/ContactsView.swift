//
//  ContactsView.swift
//  Messenger
//
//  Created by Clark Adams on 6/17/24.
//

import SwiftUI

struct ContactsView: View {
    @StateObject private var viewModel = ContactsViewModel()
    
    var body: some View {
        NavigationStack(path: $viewModel.navigationPath) {
            ZStack {
                Color.brandBackground
                    .ignoresSafeArea()
                VStack {
                    HStack {
                        RoundedRectangle(cornerRadius: 4)
                            .fill(.inputField)
                            .frame(height: 36)
                            .overlay(
                                HStack {
                                    Image(.searchIcon)
                                    TextField("Поиск", text: $viewModel.searchText)
                                        .font(.Typography.Body.body1)
                                }
                                .padding(.horizontal, 10)
                            )
                    }
                    .padding(.leading)
                    .padding(.top, 23)
                    
                    List {
                        ForEach(viewModel.filteredContacts) { contact in
                            ContactRowView(contact: contact)
                                .onTapGesture {
                                    viewModel.navigationPath.append(contact)
                                }
                        }
                        .listRowBackground(Color.brandBackground)
                    }
                    .listStyle(PlainListStyle())
                    .background(.brandBackground)
                    .navigationDestination(for: Contact.self) { contact in
                        if let index = viewModel.contacts.firstIndex(where: { $0.id == contact.id }) {
                            ContactDetailsView(navigationPath: $viewModel.navigationPath, contact: $viewModel.contacts[index])
                        }
                    }
                }
                .padding(.leading, 5)
                .padding(.trailing, 30)
                .toolbar {
                    ToolbarItemGroup(placement: .topBarLeading) {
                        Text("Контакты")
                            .font(.Typography.Subheading.sub1)
                            .lineSpacing(30)
                            .foregroundStyle(.text)
                    }
                    
                    ToolbarItem(placement: .topBarTrailing) {
                        Button(action: {
                            logMessage("Новый контакт")
                        }) {
                            Image("NewContactIcon")
                        }
                    }
                }
                .navigationBarBackButtonHidden(true)
            }
            .background(.brandBackground)
        }
        .background(.brandBackground)
    }
}

#Preview {
    ContactsView()
}
