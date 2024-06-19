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
        ZStack {
            Color.brandBackground
                .ignoresSafeArea()
            VStack {
                if let avatar = contact.avatar {
                    Image(avatar)
                        .resizable()
                        .frame(width: 150, height: 150)
                        .padding()
                        .padding(.top)
                } else {
                    Text(initials(from: contact))
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .frame(width: 100, height: 100)
                        .background(Color.purple)
                        .clipShape(Circle())
                        .padding()
                        .padding(.top)
                }
                
                Text("\(contact.firstName) \(contact.lastName ?? "")")
                    .font(.Typography.Heading.h2)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.text)
                
                Text(contact.phoneNumber)
                    .font(.Typography.Other.phone)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.phoneNumber)
                    .padding(.bottom, 30)
                
                HStack {
                    ForEach(contact.socialLinks) { link in
                        Link(destination: URL(string: link.url)!) {
                            Image(link.icon)
                                .resizable()
                                .scaledToFit()
                                .padding(12)
                                .frame(width: 71.67, height: 40)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 25)
                                        .stroke(Color.purple, lineWidth: 2)
                                )
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
                        Image("EditIcon")
                    }
                }
            }
            .navigationBarBackButtonHidden(true)
        }
    }
    
    private func initials(from contact: Contact) -> String {
        let firstInitial = contact.firstName.first ?? "?"
        if let lastName = contact.lastName {
            let lastInitial = lastName.first ?? "?"
            return "\(firstInitial)\(lastInitial)"
        } else {
            return "\(firstInitial)"
        }
    }
}

#Preview {
    let contact = Contact(
        firstName: "Анастасия",
        lastName: "Иванова",
        phoneNumber: "+7 999 111-11-11",
        socialLinks: [
            SocialLink(name: "X", url: "https://x.com", icon: "xmark.circle"),
            SocialLink(name: "Instagram", url: "https://instagram.com", icon: "camera"),
            SocialLink(name: "LinkedIn", url: "https://linkedin.com", icon: "link.circle"),
            SocialLink(name: "Facebook", url: "https://facebook.com", icon: "f.circle")
        ],
        status: "offline",
        lastSeen: "Была вчера",
        avatar: "person.crop.circle.fill",
        hasStories: false,
        gradientColors: [Color.red, Color.orange]
    )
    
    return ContactDetailsView(
        navigationPath: .constant(NavigationPath()),
        contact: .constant(contact)
    )
}
