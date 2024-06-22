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
                
                
                
                ScrollView(.vertical) {
                    VStack {
                        
                        
                        TaskCard(title: "Clean and mop the floors", date: "Sun 8/9", threshold: 3)
                        TaskCard(title: "Clean and mop the floors", date: "Sun 8/9", threshold: 3)
                        TaskCard(title: "Clean and mop the floors", date: "Sun 8/9", threshold: 3)
                        TaskCard(title: "Clean and mop the floors", date: "Sun 8/9", threshold: 3)
                        TaskCard(title: "Clean and mop the floors", date: "Sun 8/9", threshold: 3)
                        TaskCard(title: "Clean and mop the floors", date: "Sun 8/9", threshold: 3)
                        TaskCard(title: "Clean and mop the floors", date: "Sun 8/9", threshold: 3)
                        

                    }
                }
                .padding()
                
                
                

                
                 
            }
            
            
            
            
        }
        
    }
}

#Preview {
    TasksView()
}

struct TaskCard : View {
    
    var title: String
    var date: String
    var threshold: Int

    var body: some View {
        
        HStack {
            RoundedRectangle(cornerRadius: 25)
                .fill(Color("accent"))
                .frame(width: 100, height: 100)
                .padding(12)
                .overlay(
                    VStack {
                        Text(date)
                            .font(.system(size: 14, weight: .bold, design: .default))
                            .foregroundColor(Color("background"))
                            .padding(.bottom, 5)
                        HStack (spacing: -15){
                            Image(systemName: "person.crop.circle")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 40, height: 40)
                                .foregroundColor(Color("text"))
                            Image(systemName: "person.crop.circle")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 40, height: 40)
                                .foregroundColor(Color("text"))
                        }
                        .frame(width: 100)
                    }
                )
            VStack {
                Text(title)
                    .font(.system(size: 23, weight: .semibold))
                    .foregroundColor(Color("text"))
                    .padding(.top)
                    .padding(.leading, -10)
                    .frame(maxWidth: .infinity, maxHeight: 80, alignment: .topLeading)
                Spacer()
                HStack {
                    ForEach(0..<threshold, id: \.self) { _ in
                        Image(systemName: "circle.dotted")
                            .frame(maxWidth: 20, alignment: .leading)
                            .padding(.leading, -10)
                            .padding(.bottom, 25)
                            .padding(.trailing, 5)
                    }
                    Spacer()
                }
            }
            Spacer()
        }
        .frame(width: 350, height: 125)
        .background(Color("prim"))
        .clipShape(RoundedRectangle(cornerRadius: 30))
    }
}


