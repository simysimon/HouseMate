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
    
    var body: some View {
        ZStack {
            Color("background")
                .edgesIgnoringSafeArea(.all)
            
        
            
            VStack{
                
                
                Header(title: "Tasks", size: 60, isBell: $isBell)
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
            
            
            if isBell {
                Color.black.opacity(0.4)
                    .edgesIgnoringSafeArea(.all)
                    .onTapGesture {
                        withAnimation {
                            isBell = false
                        }
                    }
                
                
                
                
                // Popup window
                VStack {
                    Text("Notifications")
                        .font(.headline)
                        .padding()
                    ScrollView {
                        VStack {
                            ForEach(0..<20, id: \.self) { index in
                                Text("Notification \(index + 1)")
                                    .padding()
                                    .background(Color.white)
                                    .cornerRadius(8)
                                    .padding(.horizontal)
                            }
                        }
                    }
                    .frame(height: 300)
                    
                }
                .background(Color.white)
                .cornerRadius(12)
                .shadow(radius: 20)
                .frame(width: 300)
                .transition(.move(edge: .top))
                .offset(x: 100, y: -120)
            
                
                
                
                
            }
            
            
        }
        
    }
}

#Preview {
    TasksView()
}

struct Header: View {
    var title : String
    var size : CGFloat
    
    @Binding var  isBell : Bool
    
    var body: some View {
        HStack{
            Text(title)
                .font(.custom("SF Pro Text", size: size))
                .bold()
                .padding(.leading, 20)
                .foregroundColor(Color("text"))
            
            
            
            Button(action: {
                print("dropdown button tapped")
            }) {
                Image(systemName: "chevron.down")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 25, height: 25)
                    .foregroundColor(Color("text"))
            }
            
            Spacer()
            Button(action: {
                isBell.toggle()
            }) {
                Image(systemName: "bell")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40, height: 40)
                    .foregroundColor(Color("text"))
            }
            
            
            
            
            Button(action: {
                print("profile button tapped")
            }) {
                Image(systemName: "person.crop.circle")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 40, height: 40)
                    .foregroundColor(Color("text"))
            }
            .padding()
            
            
            
            
            
        }
    }
}





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
            .frame(width: 200, alignment: .topLeading)
            Spacer()
        }
        .frame(width: 350, height: 125)
        .background(Color("prim"))
        .clipShape(RoundedRectangle(cornerRadius: 30))
    }
}


