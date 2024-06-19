//
//  MainView.swift
//  Messenger
//
//  Created by Clark Adams on 6/17/24.
//

import SwiftUI

struct MainView: View {
    @State var selectedTab: Tab = .contacts
    
    var body: some View {
        TabView(selection: $selectedTab) {
            ContactsView()
                .tabItem {
                    Image(systemName: "person.2.fill")
                }
                .tag(Tab.contacts)
            
            ChatsView()
                .tabItem {
                    Image(systemName: "message.fill")
                }
                .tag(Tab.chats)
            
            MoreView()
                .tabItem {
                    Image(systemName: "ellipsis.circle.fill")
                }
                .tag(Tab.more)
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    MainView()
}
