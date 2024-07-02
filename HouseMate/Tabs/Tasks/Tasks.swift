//
//  Tasks.swift
//  HouseMate
//
//  Created by Simon Nguyen on 6/21/24.
//

import Foundation
import SwiftUI

struct TasksView: View {
    @State private var isOptionASelected: Bool = true
    
    @State private var isMyTaskSelected: Bool = true
    @State private var isWeekSelected: Bool = true
    
    @State private var isBell: Bool = false
    @State private var isProfile: Bool = false
    @State private var isDropdown: Bool = false
    @State private var isAdd: Bool = true
    @State private var isGroups: Bool = true
    
    var body: some View {
        ZStack {
            Color("background")
                .edgesIgnoringSafeArea(.all)
            
        
            
            VStack{
                
                
                Header(title: "Tasks", size: 60, isBell: $isBell, isProfile: $isProfile, isDropdown: $isDropdown)
                HStack {
                    toggleButton(size: 1, optionA: "My Tasks",
                                 optionB: "House Tasks",
                                 isOptionASelected: $isMyTaskSelected)
                    .padding(.leading)
                    
                    toggleButton(size: 1, optionA: "Week",
                                 optionB: "All",
                                 isOptionASelected: $isWeekSelected)
                    .padding(.trailing)
                }
                //.padding(.top, 95)
                
                
                
                Spacer()
                
                
                
                // Display the appropriate ScrollView based on the conditions
                if isMyTaskSelected && isWeekSelected {
                    ScrollViewMyWeek()
                        .transition(.move(edge: .leading))
                } else if isMyTaskSelected {
                    ScrollViewMyAll()
                        .transition(.move(edge: .trailing))
                } else if isWeekSelected {
                    ScrollViewHouseWeek()
                        .transition(.move(edge: .trailing))
                } else {
                    ScrollViewHouseAll()
                        .transition(.move(edge: .leading))
                }
                
                
                
                
                
                
                 
            }
            
//            Header(title: "Tasks", size: 60, isBell: $isBell)
//                .offset(x: 0, y: -343)
            
            if isBell {
                popupNotif(isBell: $isBell)
            }
            if isProfile {
                popupProfile(isProfile: $isProfile)
                
            }
            if isDropdown{
                popupDropdown(isDropdown: $isDropdown, isAdd: $isAdd)
            }
            
            if isAdd{
                popupAdd(isAdd: $isAdd, isGroups: $isGroups)
            }
        
            
                
        
            
        }
       

            
        
    }
}

#Preview {
    TasksView()
}










