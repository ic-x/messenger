//
//  Provider.swift
//  MessengerWidgetExtension
//
//  Created by Clark Adams on 6/25/24.
//

import WidgetKit

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> MessengerWidgetEntry {
        MessengerWidgetEntry.preview
    }

    func getSnapshot(in context: Context, completion: @escaping (MessengerWidgetEntry) -> Void) {
        completion(MessengerWidgetEntry.preview)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<MessengerWidgetEntry>) -> Void) {
        let entry = MessengerWidgetEntry(date: .now, avatar: .anastasia)
        let timeline = Timeline(entries: [entry], policy: .atEnd)
        completion(timeline)
    }
}
