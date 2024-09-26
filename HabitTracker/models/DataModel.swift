//
//  DataModel.swift
//  HabitTracker
//
//  Created by mac on 23/09/2024.
//

import Foundation

//Identifiable lets us Id each activity
//Codable allows us to save and load activities
//Equatable lets us compare activities
//This Struct holds a single activity
struct Activity: Identifiable, Codable, Equatable {
    var id = UUID()
    var title: String
    var description: String
    var completionCount: Int = 0
}

//Observable lets SwiftUI watch for changes
//This class holds a list of activities
@Observable
class Activities {
    var items: [Activity] = [] {
        //saves activities when they change
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "SavedActivities")
            }
        }
    }
    
    //load activities when it is created
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "SavedActivities") {
            if let decodedItems = try? JSONDecoder().decode([Activity].self, from: savedItems) {
                items = decodedItems
                return
            }
        }
        items = []
    }
}
