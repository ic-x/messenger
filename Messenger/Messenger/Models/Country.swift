//
//  Country.swift
//  Messenger
//
//  Created by Clark Adams on 6/13/24.
//

import Foundation

struct Country: Identifiable {
    let id = UUID()
    let name: String
    let code: String
    let flagImageName: String
}
