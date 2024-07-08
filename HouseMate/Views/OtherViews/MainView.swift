//
//  ContentView.swift
//  HouseMate
//
//  Created by Simon Nguyen on 6/14/24.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewViewModel()
    
    
    var body: some View {
        NavigationView {
            
            if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty {
                accountView
                
            } else {
                LoginView()
            }
            
            
            
        }
        
            
            
        
    }
    
    @ViewBuilder
    var accountView: some View {
        TabView {
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
}

#Preview {
    MainView()
}

