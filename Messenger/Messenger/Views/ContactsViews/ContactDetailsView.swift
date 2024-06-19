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
            if let avatar = contact.avatar {
                Image(systemName: avatar)
                    .resizable()
                    .frame(width: 100, height: 100)
                    .padding()
            } else {
                Text(initials(from: contact))
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .frame(width: 100, height: 100)
                    .background(Color.purple)
                    .clipShape(Circle())
                    .padding()
            }
            
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
                    Image(systemName: "chevron.left")
                }
                Text("Профиль")
                    .font(.subheadline)
            }
            ToolbarItem(placement: .topBarTrailing) {
                Button(action: {
                    print("Редактировать")
                }) {
                    Image(systemName: "pencil")
                }
            }
        }
        .navigationBarBackButtonHidden(true)
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
