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
    
    var body: some View {
        ZStack {
            Color("background")
                .edgesIgnoringSafeArea(.all)
            
            
            VStack{
                Header(title: "Tasks", size: 60)
                
                
                HStack {
                    toggleButton(optionA: "My Tasks",
                                 optionB: "House Tasks",
                                 isOptionASelected: $isMyTaskSelected)
                    .padding(.leading)
                    
                    toggleButton(optionA: "Week",
                                 optionB: "All",
                                 isOptionASelected: $isWeekSelected)
                    .padding(.trailing)
                }
                
                
                
                Spacer()
                
                
                
                
                HStack {
                    
                }
                
                 
            }
            
            
            
            
        }
        
    }
}

#Preview {
    TasksView()
}




