//
//  WidgetIntent.swift
//  Messenger
//
//  Created by Clark Adams on 6/25/24.
//

import WidgetKit
import AppIntents

struct ConfigurationAppIntent: WidgetConfigurationIntent {
    static var title: LocalizedStringResource = "Configuration"
    
    static var description = IntentDescription("Show avatar full screen")

    @Parameter(title: "Image full screen") var fullScreen: Bool
}


struct ChangeContactIntent: AppIntent {
    static var title: LocalizedStringResource = "Change Contact"
    
    @Parameter(title: "Contact index") var index : Int
    
    init() {}
    
    init(index: Int) {
        self.index = index
    }
    
    func perform() async throws -> some IntentResult {
        ContactsExample.shared.selected = index

        return .result()
    }
}
