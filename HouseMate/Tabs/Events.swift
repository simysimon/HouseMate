//
//  Events.swift
//  HouseMate
//
//  Created by Simon Nguyen on 6/21/24.
//

import Foundation
import SwiftUI

struct EventsView: View {
    @State private var selectedOption: Int = 0
    
    @State private var isBell: Bool = false
    

    
    var body: some View {
        ZStack {
            Color("background")
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Header(title: "Events", size: 60, isBell: $isBell)
                
                HStack {
                    threeToggleButton(optionA: "Upcoming",
                                      optionB: "Week",
                                      optionC: "Month",
                                      selectedOption: $selectedOption)  // Use selectedOption here
                    .padding(.leading)
                }
                
                Spacer().frame(height: 20) // Add some space between the toggle and the content
                
                // Conditionally display VStacks based on selected option
                
                // Upcoming
                if selectedOption == 0 {
                    VStack {
                        
                    }
                }
                
                // Week
                else if selectedOption == 1 {
                    VStack {

                    }
                }
                
                // Month
                else if selectedOption == 2 {
                    VStack {

                    }
                }
                
                Spacer()
            }
        }
    }
}


#Preview {
    EventsView()
}
