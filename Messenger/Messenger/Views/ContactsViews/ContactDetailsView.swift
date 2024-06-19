//
//  ContactDetailsView.swift
//  Messenger
//
//  Created by Clark Adams on 6/18/24.
//

import SwiftUI

struct ContactDetailsView: View {
    @Binding var navigationPath: NavigationPath
    @Binding var contact: Contact
    
    var body: some View {
        VStack {
            Image(systemName: contact.avatar)
                .resizable()
                .frame(width: 100, height: 100)
                .padding()
            
            Text("\(contact.firstName) \(contact.lastName ?? "")")
                .font(.largeTitle)
            
            Text(contact.phoneNumber)
                .font(.title2)
                .padding(.top)
            
            HStack {
                ForEach(contact.socialLinks) { link in
                    Link(destination: URL(string: link.url)!) {
                        Image(systemName: link.icon)
                            .resizable()
                            .frame(width: 30, height: 30)
                            .padding()
                    }
                }
            }
            
            Spacer()
        }
        .padding()
        .toolbar {
            ToolbarItemGroup(placement: .topBarLeading) {
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
            ToolbarItem(placement: .topBarTrailing) {
                Button(action: {
                    logMessage("Редактировать")
                }) {
                    Image("ChevronLeft")
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}
