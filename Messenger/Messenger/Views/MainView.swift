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
                    Image(selectedTab == .contacts ? "ActiveContactIcon" : "ContactIcon")
                }
                .tag(Tab.contacts)
            
            ChatsView()
                .tabItem {
                    Image(selectedTab == .chats ? "ActiveChatsIcon" : "ChatsIcon")
                }
                .tag(Tab.chats)
            
            MoreView()
                .tabItem {
                    Image(selectedTab == .more ? "ActiveMoreIcon" : "MoreIcon")
                }
                .tag(Tab.more)
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    MainView()
}
