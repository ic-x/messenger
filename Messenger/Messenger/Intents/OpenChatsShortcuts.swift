//
//  OpenChatsShortcuts.swift
//  Messenger
//
//  Created by Clark Adams on 6/25/24.
//

import AppIntents

struct OpenChatsShortcuts: AppShortcutsProvider {
    static var appShortcuts: [AppShortcut] {
        AppShortcut(
            intent: OpenChatsIntent(),
            phrases: [
                "Open chats",
            ],
            shortTitle: "Chats",
            systemImageName: "message"
        )
    }
}
