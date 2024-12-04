//
//  CodeDigitView.swift
//  Messenger
//
//  Created by Clark Adams on 6/15/24.
//

import SwiftUI

struct CodeDigitView: View {
    let digit: String
    
    var body: some View {
        ZStack {
            if digit.isEmpty {
                Circle()
                    .fill(.masking)
                    .frame(width: 60, height: 30)
            } else {
                Text(digit)
                    .font(.Typography.Heading.h1)
                    .frame(width: 60, height: 30)
                    .foregroundStyle(.text)
            }
        }
    }
}

#Preview {
    VStack(spacing: 10) {
        CodeDigitView(digit: "")
            .previewDisplayName("Кружок")
        
        CodeDigitView(digit: "1")
            .previewDisplayName("1")
        
        CodeDigitView(digit: "123")
            .previewDisplayName("123")
    }
    .padding()
    .previewLayout(.sizeThatFits)
}
