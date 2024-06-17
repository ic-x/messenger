//
//  MainView.swift
//  Messenger
//
//  Created by Clark Adams on 6/17/24.
//

import SwiftUI

struct MainView: View {
    @Binding var selectedTab: Tab
    
    var body: some View {
        TabView(selection: $selectedTab) {
            ContactsView()
                .tabItem {
                    Image(systemName: "person.2.fill")
                }
            
            ChatsView()
                .tabItem {
                    Image(systemName: "message.fill")
                }
            
            MoreView()
                .tabItem {
                    Image(systemName: "ellipsis.circle.fill")
                }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    @State var selectedTab = Tab.contacts
    return MainView(selectedTab: $selectedTab)
}
