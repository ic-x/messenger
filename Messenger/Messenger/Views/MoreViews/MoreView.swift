//
//  MoreView.swift
//  Messenger
//
//  Created by Clark Adams on 6/17/24.
//

import SwiftUI

struct MoreView: View {
    var body: some View {
        ZStack {
            Color.brandBackground
                .ignoresSafeArea()
            VStack {
                Text("Дополнительные опции")
                    .font(.Typography.Subheading.sub2)
                    .lineSpacing(28)
                    .multilineTextAlignment(.center)
            }
        }
    }
}

#Preview {
    return MoreView()
}
