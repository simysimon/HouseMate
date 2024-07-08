//
//  ProfileView.swift
//  HouseMate
//
//  Created by Simon Nguyen on 7/7/24.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel()
    var body: some View {
        
        NavigationView {
            VStack {
                if let user = viewModel.user {
                    profile(user: user)
                } else {
                    Text("Loading Profie...")
                    HMButton(title: "Log Out", background: Color(.red)) {
                        viewModel.logout()
                    }
                }
                
                
            }
            .navigationTitle("Profile")
        }
        .onAppear {
            viewModel.fetchUser()
        }
        
    }
    
    @ViewBuilder
    func profile(user: User) -> some View {
        Image(systemName: "person.circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(Color.blue)
            .frame(width: 125, height: 125)
        
        VStack (alignment: .leading){
            HStack {
                Text("Name: ")
                Text(user.name)
                
            }
            HStack {
                Text("Email: ")
                Text(user.email)
                
            }
            HStack {
                Text("Member Since: ")
                Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
                
            }
        }
        HMButton(title: "Log Out", background: Color(.red)) {
            viewModel.logout()
        }
    }
}

#Preview {
    ProfileView()
}
