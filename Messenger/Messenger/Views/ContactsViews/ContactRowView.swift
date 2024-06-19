//
//  ContactRowView.swift
//  Messenger
//
//  Created by Clark Adams on 6/19/24.
//

import SwiftUI

struct ContactRowView: View {
    var contact: Contact
    
    var body: some View {
        HStack {
            ZStack(alignment: .topTrailing) {
                ZStack(alignment: .center) {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(LinearGradient(gradient: Gradient(colors: contact.gradientColors), startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 3)
                        .frame(width: 50, height: 50)
                        .opacity(contact.hasStories ? 1 : 0)
                    
                    if let avatar = contact.avatar {
                        Image(avatar)
                            .resizable()
                            .frame(width: 40, height: 40)
                            .clipShape(Circle())
                    } else {
                        Text(initials(from: contact))
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(width: 40, height: 40)
                            .background(Color.purple)
                            .clipShape(Circle())
                    }
                }
                
                if contact.status == "online" {
                    Circle()
                        .fill(Color.green)
                        .frame(width: 12, height: 12)
                }
            }
            
            VStack(alignment: .leading) {
                Text("\(contact.firstName) \(contact.lastName ?? "")")
                    .font(.headline)
                
                if contact.status == "online" {
                    Text("Онлайн")
                        .font(.subheadline)
                        .foregroundColor(.green)
                } else if let lastSeen = contact.lastSeen {
                    Text(lastSeen)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }
            
            Spacer()
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
        firstName: "John",
        lastName: "Doe",
        phoneNumber: "+1 555 555-01-99",
        socialLinks: [
            SocialLink(name: "X", url: "https://x.com", icon: "xmark.circle"),
            SocialLink(name: "Instagram", url: "https://instagram.com", icon: "camera"),
            SocialLink(name: "LinkedIn", url: "https://linkedin.com", icon: "link.circle"),
            SocialLink(name: "Facebook", url: "https://facebook.com", icon: "f.circle")
        ],
        status: "online",
        lastSeen: nil,
        avatar: nil,
        hasStories: true,
        gradientColors: [Color.green, Color.blue]
    )
    return ContactRowView(contact: contact)
}
