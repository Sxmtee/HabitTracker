//
//  AddActivityView.swift
//  HabitTracker
//
//  Created by mac on 23/09/2024.
//

import SwiftUI

struct AddActivityView: View {
    @Environment(\.dismiss) var dismiss
    @State private var title = ""
    @State private var description = ""
    
    var activities: Activities
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Title", text: $title)
                TextField("Description", text: $description)
            }
            .navigationTitle("Add New Habit")
            .toolbar {
                Button("Save") {
                    let newActivity = Activity(title: title, description: description)
                    activities.items.append(newActivity)
                    dismiss()
                }
            }
        }
    }
}
