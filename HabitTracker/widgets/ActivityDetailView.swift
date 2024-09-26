//
//  ActivityDetailView.swift
//  HabitTracker
//
//  Created by mac on 23/09/2024.
//

import SwiftUI

struct ActivityDetailView: View {
    @State var activity: Activity
    var activities: Activities
    
    var body: some View {
        VStack {
            Text(activity.title)
                .font(.largeTitle)
            Text(activity.description)
                .font(.body)
                .padding()
            Text("Completed \(activity.completionCount) times")
                .font(.headline)
                .padding()
            Button("Mark as Completed") {
                if let index = activities.items.firstIndex(of: activity) {
                    var updatedActivity = activity
                    updatedActivity.completionCount += 1
                    activities.items[index] = updatedActivity
                    activity = updatedActivity
                }
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
    }
}
