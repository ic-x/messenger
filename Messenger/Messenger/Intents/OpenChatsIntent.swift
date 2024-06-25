//
//  OpenChatsIntent.swift
//  Messenger
//
//  Created by Clark Adams on 6/25/24.
//

import AppIntents
import SwiftUI

struct OpenChatsIntent: AppIntent {
    static let title: LocalizedStringResource = "Open chats"
    static let description = IntentDescription(
        "Opens the chat tab in the app.",
        categoryName: "Navigation"
    )
    
    static var openAppWhenRun: Bool = true
    
    @MainActor
    func perform() async throws -> some IntentResult {
        Router.shared.move(to: .chats)
        return .result()
    }
}
