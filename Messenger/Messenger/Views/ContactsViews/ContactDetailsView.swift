//
//  ContactDetailsView.swift
//  Messenger
//
//  Created by Clark Adams on 6/18/24.
//

import SwiftUI

struct ContactDetailsView: View {
    @StateObject private var viewModel: ContactDetailsViewModel
    
    init(navigationPath: Binding<NavigationPath>, contact: Binding<Contact>) {
        _viewModel = StateObject(wrappedValue: ContactDetailsViewModel(navigationPath: navigationPath, contact: contact))
    }
    
    var body: some View {
        ZStack {
            Color.brandBackground
                .ignoresSafeArea()
            VStack {
                if let avatar = viewModel.contact.avatar {
                    Image(avatar)
                        .resizable()
                        .frame(width: 150, height: 150)
                        .padding()
                        .padding(.top)
                } else {
                    Text(viewModel.initials)
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                        .frame(width: 100, height: 100)
                        .background(.purple)
                        .clipShape(Circle())
                        .padding()
                        .padding(.top)
                }
                
                Text("\(viewModel.contact.firstName) \(viewModel.contact.lastName ?? "")")
                    .font(.Typography.Heading.h2)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.text)
                
                Text(viewModel.contact.phoneNumber)
                    .font(.Typography.Other.phone)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.phoneNumber)
                    .padding(.bottom, 30)
                
                HStack {
                    ForEach(viewModel.contact.socialLinks) { link in
                        Link(destination: URL(string: link.url)!) {
                            Image(link.icon)
                                .resizable()
                                .scaledToFit()
                                .padding(12)
                                .frame(width: 71.67, height: 40)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 25)
                                        .stroke(.purple, lineWidth: 2)
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
                        if !viewModel.navigationPath.isEmpty {
                            viewModel.navigationPath.removeLast()
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
}

#Preview {
    let contact = Contact(
        firstName: "Анастасия",
        lastName: "Иванова",
        phoneNumber: "+7 999 111-11-11",
        socialLinks: [
            SocialLink(name: "X", url: "https://x.com", icon: "TwitterIcon"),
            SocialLink(name: "Instagram", url: "https://instagram.com", icon: "InstagramIcon"),
            SocialLink(name: "LinkedIn", url: "https://linkedin.com", icon: "LinkedInIcon"),
            SocialLink(name: "Facebook", url: "https://facebook.com", icon: "FacebookIcon")
        ],
        status: "offline",
        lastSeen: "Была вчера",
        avatar: "AnastasiaIvanovaAvatar",
        hasStories: false,
        gradientColors: []
    )
    
    return ContactDetailsView(
        navigationPath: .constant(NavigationPath()),
        contact: .constant(contact)
    )
}
