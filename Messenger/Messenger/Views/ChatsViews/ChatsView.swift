//
//  ChatsView.swift
//  Messenger
//
//  Created by Clark Adams on 6/17/24.
//

import SwiftUI

struct ChatsView: View {
    var body: some View {
        ZStack {
            Color.brandBackground
                .ignoresSafeArea()
            VStack {
                Text("Список чатов")
            }
        }
    }
}

#Preview {
    ChatsView()
}
