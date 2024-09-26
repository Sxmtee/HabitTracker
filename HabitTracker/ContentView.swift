//
//  ContentView.swift
//  HabitTracker
//
//  Created by mac on 23/09/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var activities = Activities()
    @State private var showingAddActivity = false
    
    func truncateDescription(_ description: String, maxLength: Int) -> String {
        if description.count <= maxLength {
            return description
        } else {
            let index = description.index(
                description.startIndex,
                offsetBy: maxLength - 3
            )
            return String(description[..<index]) + "..."
        }
    }
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(activities.items) { activity in
                    NavigationLink(
                        destination:
                            ActivityDetailView(
                                activity: activity,
                                activities: activities
                            )
                    ) {
                        VStack (alignment: .leading) {
                            Text(activity.title)
                                .font(.headline)
                            Text(
                                truncateDescription(
                                    activity.description,
                                    maxLength: 20
                                )
                            )
                                .font(.subheadline)
                                .foregroundStyle(.secondary)
                        }
                    }
                }
            }
            .navigationTitle("Habit Tracker")
            .toolbar {
                Button("Add new habit") {
                    showingAddActivity = true
                }
            }
            .sheet(isPresented: $showingAddActivity) {
                AddActivityView(activities: activities)
            }
        }
    }
}

#Preview {
    ContentView()
}
