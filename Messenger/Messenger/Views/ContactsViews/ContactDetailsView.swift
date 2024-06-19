//
//  ContactDetailsView.swift
//  Messenger
//
//  Created by Clark Adams on 6/18/24.
//

import SwiftUI

struct ContactRow: View {
    var contact: Contact
    
    var body: some View {
        HStack {
            ZStack(alignment: .topTrailing) {
                Image(systemName: "person.crop.circle.fill")
                    .resizable()
                    .frame(width: 40, height: 40)
                
                if contact.status == "online" {
                    Circle()
                        .fill(Color.green)
                        .frame(width: 10, height: 10)
                        .offset(x: 5, y: -5)
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
}

struct SearchBar: View {
    @Binding var text: String
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
            TextField("Поиск", text: $text)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }
        .padding()
    }
}

struct ContactDetailsView: View {
    @Binding var navigationPath: NavigationPath
    var contact: Contact
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    if !navigationPath.isEmpty {
                        navigationPath.removeLast()
                    }
                }) {
                    Image(systemName: "chevron.left")
                        .padding()
                }
                Spacer()
                Text("Профиль")
                    .font(.headline)
                Spacer()
                Button(action: {
                }) {
                    Image(systemName: "pencil")
                        .padding()
                }
            }
            
            Image(systemName: "person.crop.circle.fill")
                .resizable()
                .frame(width: 100, height: 100)
                .padding()
            
            Text("\(contact.firstName) \(contact.lastName ?? "")")
                .font(.largeTitle)
            
            Text(contact.phoneNumber)
                .font(.title2)
                .padding(.top)
            
            HStack {
                ForEach(contact.socialLinks.keys.sorted(), id: \.self) { key in
                    if let url = contact.socialLinks[key] {
                        Link(destination: URL(string: url)!) {
                            Image(systemName: icon(for: key))
                                .resizable()
                                .frame(width: 30, height: 30)
                                .padding()
                        }
                    }
                }
            }
            
            Spacer()
        }
        .navigationBarBackButtonHidden(true)
        .padding()
    }
    
    
    
    func icon(for socialMedia: String) -> String {
        switch socialMedia {
        case "X":
            return "xmark.circle"
        case "inst":
            return "camera"
        case "linkedin":
            return "link.circle"
        case "facebook":
            return "f.circle"
        default:
            return "questionmark.circle"
        }
    }
}

//#Preview {
//    ContactDetailsView()
//}
