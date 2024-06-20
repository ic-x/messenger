//
//  ContactRowView.swift
//  Messenger
//
//  Created by Clark Adams on 6/19/24.
//

import SwiftUI

struct ContactRowView: View {
    @StateObject var viewModel: ContactRowViewModel
    
    init(contact: Contact) {
        _viewModel = StateObject(wrappedValue: ContactRowViewModel(contact: contact))
    }
    
    var body: some View {
        ZStack {
            Color.brandBackground
                .ignoresSafeArea()
            HStack {
                ZStack(alignment: .topTrailing) {
                    ZStack(alignment: .center) {
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(LinearGradient(gradient: Gradient(colors: viewModel.contact.gradientColors), startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 2)
                            .frame(width: 56, height: 56)
                            .opacity(viewModel.contact.hasStories ? 1 : 0)
                        
                        if let avatar = viewModel.contact.avatar {
                            Image(avatar)
                                .resizable()
                                .frame(width: 48, height: 48)
                                .clipShape(RoundedRectangle(cornerRadius: 16))
                        } else {
                            Text(viewModel.initials)
                                .font(.headline)
                                .foregroundStyle(.white)
                                .frame(width: 48, height: 48)
                                .background(.purple)
                                .clipShape(RoundedRectangle(cornerRadius: 16))
                        }
                    }
                    .background(.brandBackground)
                    
                    if viewModel.contact.status == "online" {
                        Circle()
                            .fill(.white)
                            .frame(width: 16, height: 16)
                            .overlay(
                                Circle()
                                    .fill(.success)
                                    .frame(width: 12, height: 12)
                            )
                            .offset(x: -1, y: 1)
                    }
                }
                .background(.brandBackground)
                
                VStack(alignment: .leading) {
                    Text("\(viewModel.contact.firstName) \(viewModel.contact.lastName ?? "")")
                        .font(.headline)
                    
                    if viewModel.contact.status == "online" {
                        Text("Онлайн")
                            .font(.subheadline)
                            .foregroundStyle(.success)
                    } else if let lastSeen = viewModel.contact.lastSeen {
                        Text(lastSeen)
                            .font(.subheadline)
                            .foregroundStyle(.gray)
                    }
                }
                .background(.brandBackground)
                
                Spacer()
            }
            .background(.brandBackground)
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
        gradientColors: [.success, .blue]
    )
    return ContactRowView(contact: contact)
}
