//
//  MessengerWidget.swift
//  MessengerWidget
//
//  Created by Clark Adams on 6/25/24.
//

import WidgetKit
import SwiftUI

struct Provider: AppIntentTimelineProvider {
    func placeholder(in context: Context) -> WidgetEntry {
        WidgetEntry(contactToDisplay: ContactsExample.shared.contacts, selected: ContactsExample.shared.selected)
    }

    func snapshot(for configuration: ConfigurationAppIntent, in context: Context) async -> WidgetEntry {
        WidgetEntry(contactToDisplay: ContactsExample.shared.contacts, selected: ContactsExample.shared.selected)
    }
    
    func timeline(for configuration: ConfigurationAppIntent, in context: Context) async -> Timeline<WidgetEntry> {
        let timeline = Timeline(entries: [WidgetEntry(contactToDisplay: ContactsExample.shared.contacts, selected: ContactsExample.shared.selected)], policy: .atEnd)
        return timeline
    }
}

struct WidgetEntry: TimelineEntry {
    var date: Date = .now
    var contactToDisplay: [Contact]
    var selected: Int
}

struct MessengerWidgetEntryView : View {
    @Environment(\.widgetFamily) var family
    var entry: Provider.Entry

    var body: some View {
        switch family {
        case .systemSmall:
            MediumWidgetView(entry: entry)
        case .systemMedium:
            MediumWidgetView(entry: entry)
        case .systemLarge:
            MediumWidgetView(entry: entry)
        case .systemExtraLarge:
            MediumWidgetView(entry: entry)
        case .accessoryCircular:
            MediumWidgetView(entry: entry)
        case .accessoryRectangular:
            MediumWidgetView(entry: entry)
        case .accessoryInline:
            MediumWidgetView(entry: entry)
        @unknown default:
            MediumWidgetView(entry: entry)
        }
    }
}

struct MessengerWidget: Widget {
    @Environment(\.widgetFamily) var family
    let kind: String = "MessengerWidget"

    var body: some WidgetConfiguration {
        AppIntentConfiguration(kind: kind, intent: ConfigurationAppIntent.self, provider: Provider()) { entry in
            MessengerWidgetEntryView(entry: entry)
                .containerBackground(.fill.tertiary, for: .widget)
        }
        .supportedFamilies([.systemMedium])
    }
}

struct MediumWidgetView: View {
    var entry: Provider.Entry

    var body: some View {
        GeometryReader { geo in
            HStack {
                VStack () {
                    Text(entry.contactToDisplay[entry.selected].fullName)
                        .font(.headline)
                        .foregroundColor(.purple)
                        .frame(width: 140, height: 20)

                    contactImageView
                }
                
                Spacer().frame(width: 50)

                HStack {
                    changeContactButton(imageName: "chevron.left",
                                        intentIndex: (entry.selected - 1 + entry.contactToDisplay.count) % entry.contactToDisplay.count
                    )
                    
                    changeContactButton(imageName: "chevron.right",
                                        intentIndex: (entry.selected + 1) % entry.contactToDisplay.count
                    )
                }
            }
            .widgetURL(URL(string: "myapp://contactdetails?initials=\(entry.contactToDisplay[entry.selected].initials)&creationDate=\(entry.contactToDisplay[entry.selected].creationDate)")!)
        }
    }
}



extension MediumWidgetView {
    @ViewBuilder
    private var contactImageView: some View {
        if let imageName = entry.contactToDisplay[entry.selected].avatar {
            Image(imageName)
                .resizable()
                .frame(width: 75, height: 75)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.purple, lineWidth: 2))
        } else {
            Circle()
                .frame(width: 75, height: 75)
                .foregroundStyle(Color.purple)
                .overlay(
                    Text(entry.contactToDisplay[entry.selected].initials)
                        .foregroundColor(.white)
                        .font(.system(size: 14, weight: .bold))
                )
        }
    }


    
    private func changeContactButton(imageName: String, intentIndex: Int) -> some View {
        Button(intent: ChangeContactIntent(index: (intentIndex))) {
            Image(systemName: imageName)
                .foregroundStyle(Color.white)
        }
        .frame(width: 40, height: 40)
        .background(
            Circle()
                .foregroundColor(Color.purple)
        )
        .buttonStyle(.plain)
    }


}

#Preview(as: .systemExtraLarge) {
    MessengerWidget()
} timeline: {
    WidgetEntry(contactToDisplay: Array(ContactsExample.shared.contacts), selected: 0)
    WidgetEntry(contactToDisplay: Array(ContactsExample.shared.contacts), selected: 0)
}
