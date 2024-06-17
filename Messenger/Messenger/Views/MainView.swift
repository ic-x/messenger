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
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Text(titleForSelectedTab(selectedTab))
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                HStack {
                    switch selectedTab {
                    case .contacts:
                        Button(action: {
                            print("Добавить контакт")
                        }) {
                            Image(systemName: "plus")
                        }
                    case .chats:
                        Button(action: {
                            print("Создать чат")
                        }) {
                            Image(systemName: "plus")
                        }
                        Button(action: {
                            print("Прочитать все сообщения")
                        }) {
                            Image(systemName: "envelope.open.fill")
                        }
                    default:
                        EmptyView()
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
    
    private func titleForSelectedTab(_ tab: Tab) -> String {
        switch tab {
        case .contacts:
            return "Контакты"
        case .chats:
            return "Чаты"
        case .more:
            return "Еще"
        }
    }
}

#Preview {
    @State var selectedTab = Tab.contacts
    return MainView(selectedTab: $selectedTab)
}
