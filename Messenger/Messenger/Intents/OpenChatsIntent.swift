//
//  OpenChatsIntent.swift
//  Messenger
//
//  Created by Clark Adams on 6/25/24.
//

import Foundation
import AppIntents

final class ChatsIntent: AppIntent {
    static var title: LocalizedStringResource = "Open Chats"
    static var openAppWhenRun: Bool = true

    func perform() async throws -> some IntentResult {
        NotificationCenter.default.post(name: .openChats, object: nil)
        return .result()
    }
}

extension Notification.Name {
    static let openChats = Notification.Name("openChats")
}
