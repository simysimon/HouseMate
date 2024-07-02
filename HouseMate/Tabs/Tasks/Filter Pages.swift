//
//  Task Filter Pages.swift
//  HouseMate
//
//  Created by Simon Nguyen on 6/26/24.
//

import Foundation
import SwiftUI


struct ScrollViewMyWeek: View {
    var body: some View {
        ScrollView(.vertical) {
            LazyVStack {
                TaskCard(title: "Trash Duty", date: "This Week", threshold: 0)
                TaskCard(title: "Clean and mop the floors", date: "Sun 8/9", threshold: 3)
                TaskCard(title: "Clean Bathroom", date: "Sun 8/9", threshold: 1)
                TaskCard(title: "Take out the Trash", date: "Sun 8/16", threshold: 3)
            }
        }
        .padding()
    }
}
struct ScrollViewHouseWeek: View {
    var body: some View {
        ScrollView(.vertical) {
            
            LazyVStack {
                TaskCard(title: "Deep Clean", date: "This Week", threshold: 0)
                TaskCard(title: "Ktan shower", date: "Sun 8/9", threshold: 3)
                TaskCard(title: "Clean Bathroom", date: "Sun 8/9", threshold: 1)
                TaskCard(title: "Ktan close the back door", date: "Sun 8/16", threshold: 3)
            }
        }
        .padding()
    }
}
struct ScrollViewMyAll: View {
    var body: some View {
        ScrollView(.vertical) {
            LazyVStack {
                TaskCard(title: "Trash Duty", date: "This Week", threshold: 0)
                TaskCard(title: "Clean and mop the floors", date: "Sun 8/9", threshold: 3)
                TaskCard(title: "Clean Bathroom", date: "Sun 8/9", threshold: 1)
                TaskCard(title: "Take out the Trash", date: "Sun 8/16", threshold: 3)
                TaskCard(title: "Trash Duty", date: "This Week", threshold: 0)
                TaskCard(title: "Clean and mop the floors", date: "Sun 8/9", threshold: 3)
                TaskCard(title: "Clean Bathroom", date: "Sun 8/9", threshold: 1)
                TaskCard(title: "Take out the Trash", date: "Sun 8/16", threshold: 3)
            }
        }
        .padding()
    }
}
struct ScrollViewHouseAll: View {
    var body: some View {
        ScrollView(.vertical) {
            LazyVStack {
                TaskCard(title: "Trash Duty", date: "This Week", threshold: 0)
                TaskCard(title: "Clean and mop the floors", date: "Sun 8/9", threshold: 3)
                TaskCard(title: "Clean Bathroom", date: "Sun 8/9", threshold: 1)
                TaskCard(title: "Take out the Trash", date: "Sun 8/16", threshold: 3)
                TaskCard(title: "Trash Duty", date: "This Week", threshold: 0)
                TaskCard(title: "Clean and mop the floors", date: "Sun 8/9", threshold: 3)
                TaskCard(title: "Clean Bathroom", date: "Sun 8/9", threshold: 1)
                TaskCard(title: "Take out the Trash", date: "Sun 8/16", threshold: 3)
                TaskCard(title: "Trash Duty", date: "This Week", threshold: 0)
                TaskCard(title: "Clean and mop the floors", date: "Sun 8/9", threshold: 3)
                TaskCard(title: "Clean Bathroom", date: "Sun 8/9", threshold: 1)
                TaskCard(title: "Take out the Trash", date: "Sun 8/16", threshold: 3)
                TaskCard(title: "Trash Duty", date: "This Week", threshold: 0)
                TaskCard(title: "Clean and mop the floors", date: "Sun 8/9", threshold: 3)
                TaskCard(title: "Clean Bathroom", date: "Sun 8/9", threshold: 1)
                TaskCard(title: "Take out the Trash", date: "Sun 8/16", threshold: 3)
            }
        }
        .padding()
    }
}




