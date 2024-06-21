//
//  ContentView.swift
//  HouseMate
//
//  Created by Simon Nguyen on 6/14/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    
    
    var body: some View {
        
        TabView {
            HomeView()
                .tabItem() {
                    Image(systemName: "house")
                }
            TasksView()
                .tabItem() {
                    Image(systemName: "checkmark.circle")
                }
            ExpensesView()
                .tabItem() {
                    Image(systemName: "dollarsign.circle")
                }
            EventsView()
                .tabItem() {
                    Image(systemName: "calendar")
                }
            
        }
        
        
    }
}

#Preview {
    ContentView()
}

