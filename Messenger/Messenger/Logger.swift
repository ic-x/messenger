//
//  Logger.swift
//  Messenger
//
//  Created by Clark Adams on 6/18/24.
//

import os
import Foundation

let log = OSLog(subsystem: Bundle.main.bundleIdentifier ?? "com.example.app", category: "general")

func logMessage(_ message: String) {
    os_log("Log message: %@", log: log, message)
}
