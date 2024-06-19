//
//  MoreView.swift
//  Messenger
//
//  Created by Clark Adams on 6/17/24.
//

import SwiftUI

struct MoreView: View {
    @Binding var selectedTab: Tab
    
    var body: some View {
        VStack {
            Text("Дополнительные опции")
        }
    }
}

#Preview {
    @State var selectedTab = Tab.more
    return MoreView(selectedTab: $selectedTab)
}
