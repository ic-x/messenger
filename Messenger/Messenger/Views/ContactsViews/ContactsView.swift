//
//  ContactsView.swift
//  Messenger
//
//  Created by Clark Adams on 6/17/24.
//

import SwiftUI

struct ContactsView: View {
    @State private var isShowingContactDetailsView = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Список контактов")
            }
            .navigationDestination(isPresented: $isShowingContactDetailsView) {
                ContactDetailsView()
            }
        }
    }
}

#Preview {
    ContactsView()
}
