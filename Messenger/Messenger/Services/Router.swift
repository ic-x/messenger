//
//  Router.swift
//  Messenger
//
//  Created by Clark Adams on 6/25/24.
//

import SwiftUI

final class Router: ObservableObject {
    
    @Published var selectedTab: Tab = .contacts

    // TODO refactor singleton
    static let shared: Router = .init()
    
    private init() {}
    
    func move(to tab: Tab) {
        selectedTab = tab
    }
    
}
