//
//  SearchBarView.swift
//  Messenger
//
//  Created by Clark Adams on 6/19/24.
//

import SwiftUI

struct SearchBarView: View {
    @Binding var text: String
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
            TextField("Поиск", text: $text)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }
        .padding()
    }
}

#Preview {
    SearchBarView(text: .constant(""))
}
