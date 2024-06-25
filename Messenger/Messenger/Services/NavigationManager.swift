//
//  NavigationManager.swift
//  Messenger
//
//  Created by Clark Adams on 6/19/24.
//

import SwiftUI

enum ContactsNavigationPath: Hashable {
    // Add routes for contacts
}

enum ChatsNavigationPath: Hashable {
    // Add routes for chats
}

enum MoreNavigationPath: Hashable {
    // Add routes for the "More" section
}

final class NavigationManager<Route: Hashable>: ObservableObject {
    @Binding var navigationStack: [Route]
    
    init(navigationStack: Binding<[Route]>) {
        self._navigationStack = navigationStack
    }
    
    func navigateTo(_ route: Route) {
        navigationStack.append(route)
    }
    
    func goBack() {
        _ = navigationStack.popLast()
    }
    
    func resetNavigation() {
        navigationStack.removeAll()
    }
}
