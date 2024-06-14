//
//  Font+Typography.swift
//  Messenger
//
//  Created by Clark Adams on 6/14/24.
//

import SwiftUI

extension Font {
    struct Typography {
        struct Heading {
            static let h1 = Font.custom("SFProDisplay-Bold", size: 32)
            static let h2 = Font.custom("SFProDisplay-Bold", size: 24)
        }
        
        struct Subheading {
            static let sub1 = Font.custom("SFProDisplay-SemiBold", size: 18)
            static let sub2 = Font.custom("SFProDisplay-SemiBold", size: 16)
        }
        
        struct Body {
            static let body1 = Font.custom("SFProDisplay-SemiBold", size: 14)
            static let body2 = Font.custom("SFProDisplay-Regular", size: 14)
        }
        
        struct Metadata {
            static let metadata1 = Font.custom("SFProDisplay-Regular", size: 12)
            static let metadata2 = Font.custom("SFProDisplay-Regular", size: 10)
            static let metadata3 = Font.custom("SFProDisplay-SemiBold", size: 10)
        }
    }
}
