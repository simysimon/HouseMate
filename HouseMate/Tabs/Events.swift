//
//  Events.swift
//  HouseMate
//
//  Created by Simon Nguyen on 6/21/24.
//

import Foundation
import SwiftUI

extension Date {
    func dayName() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE" // Day of the week
        return dateFormatter.string(from: self)
    }
    
    func monthDay() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd" // Month and day
        return dateFormatter.string(from: self)
    }
}


struct EventsView: View {
    @State private var selectedOption: Int = 1
    
    @State private var isBell: Bool = false
    
    @State private var selectedDate: Date? = nil  // State to track the selected date
    @State private var currentMonth: Date = Date()  // State to track the current month
        let events: [Date] = [
            // Sample event dates
            Calendar.current.date(byAdding: .day, value: 1, to: Date())!,
            Calendar.current.date(byAdding: .day, value: 3, to: Date())!,
            Calendar.current.date(byAdding: .day, value: 5, to: Date())!,
        ]

    
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
                
                //Week
                else if selectedOption == 1 {
                    VStack {
                        let eventsDict: [Date: [String]] = Dictionary(uniqueKeysWithValues: events.map { ($0, [""]) })
                        WeekView(events: eventsDict)
                    }
                }
                
                
                // Month
                else if selectedOption == 2 {
                    VStack {
                        CalendarView(events: events, selectedDate: $selectedDate, currentMonth: $currentMonth)
                    }
                }
                Spacer()
            }
        }
    }
}

private func getDaysInWeek() -> [Date] {
    guard let weekInterval = Calendar.current.dateInterval(of: .weekOfYear, for: Date()) else {
        return []
    }
    
    var days = [Date]()
    var currentDate = weekInterval.start
    
    while currentDate <= weekInterval.end {
        days.append(currentDate)
        currentDate = Calendar.current.date(byAdding: .day, value: 1, to: currentDate)!
    }
    
    return days
}

struct WeekView: View {
    let events: [Date: [String]] // Sample event dates
    
    private func getDaysInWeek() -> [Date] {
        guard let weekInterval = Calendar.current.dateInterval(of: .weekOfYear, for: Date()) else {
            return []
        }
        
        var days = [Date]()
        var currentDate = weekInterval.start
        
        while currentDate <= weekInterval.end {
            days.append(currentDate)
            currentDate = Calendar.current.date(byAdding: .day, value: 1, to: currentDate)!
        }
        
        return days
    }
    
    var body: some View {
        let daysInWeek = getDaysInWeek()
        
        ScrollView {
            VStack(spacing: 10) {
                ForEach(daysInWeek, id: \.self) { day in
                    VStack {
                        HStack {
                            Text("\(day.dayName()) \n \(day.monthDay())")
                                .font(.system(size: 13, weight: .bold, design: .default))
                                .foregroundColor(.white)
                                .background(
                                    RoundedRectangle(cornerRadius: 115)
                                        .fill(Color.blue)
                                )
                                .multilineTextAlignment(.center) // Center-align the text within the RoundedRectangle
                                .padding(EdgeInsets(top: 10, leading: 10, bottom: 7, trailing: 7)) // Adjust padding for text within RoundedRectangle
                                .frame(maxWidth: 100, alignment: .leading)
                            
                            Spacer()
                        }
                        
                        if let eventsForDay = events[day] {
                            ForEach(eventsForDay, id: \.self) { event in
                                RoundedRectangle(cornerRadius: 115)
                                    .fill(Color.green)
                                    .frame(height: 40)
                                    .padding()
                                    .overlay(
                                        Text(event)
                                            .foregroundColor(.white)
                                            .padding()
                                    )
                                    .padding(.horizontal)
                            }
                        }
                    }
                    .padding()
                    .background(Color.secondary.opacity(0.1))
                    .cornerRadius(115)
                    .padding(.horizontal)
                }
            }
        }
    }
}

struct CalendarView: View {
    let events: [Date] // Array of event dates
    @Binding var selectedDate: Date?
    @Binding var currentMonth: Date  // Binding to track the current month
    let calendar = Calendar.current
    let dateFormatter: DateFormatter
    
    init(events: [Date], selectedDate: Binding<Date?>, currentMonth: Binding<Date>) {
        self.events = events
        self._selectedDate = selectedDate
        self._currentMonth = currentMonth
        self.dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM yyyy"
    }
    
    var body: some View {
        let days = generateDaysInMonth(for: currentMonth)
        
        VStack {
            // Month navigation
            HStack {
                Button(action: {
                    currentMonth = calendar.date(byAdding: .month, value: -1, to: currentMonth)!
                }) {
                    Image(systemName: "chevron.left")
                        .padding()
                }
                Text(dateFormatter.string(from: currentMonth))
                    .font(.title)
                    .padding()
                Button(action: {
                    currentMonth = calendar.date(byAdding: .month, value: 1, to: currentMonth)!
                }) {
                    Image(systemName: "chevron.right")
                        .padding()
                }
            }
            
            HStack {
                Text("Sun").frame(maxWidth: .infinity)
                Text("Mon").frame(maxWidth: .infinity)
                Text("Tue").frame(maxWidth: .infinity)
                Text("Wed").frame(maxWidth: .infinity)
                Text("Thu").frame(maxWidth: .infinity)
                Text("Fri").frame(maxWidth: .infinity)
                Text("Sat").frame(maxWidth: .infinity)
            }
            
            ForEach(0..<days.count / 7 + (days.count % 7 == 0 ? 0 : 1), id: \.self) { weekIndex in
                HStack {
                    ForEach(0..<7, id: \.self) { dayIndex in
                        if (weekIndex * 7 + dayIndex) < days.count {
                            let day = days[weekIndex * 7 + dayIndex]
                            if !day.number.isEmpty { // Only valid days
                                Text(day.number)
                                    .frame(width: 40, height: 40)
                                    .padding(3)
                                    .background(
                                        RoundedRectangle(cornerRadius: 5)
                                            .fill(events.contains(day.date) ? Color.green : Color.clear)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 5)
                                                    .strokeBorder(Color.gray, lineWidth: selectedDate == day.date ? 2 : 0)
                                            )
                                    )
                                    .foregroundColor(isCurrentDate(day.date) ? .red : .primary)
                                    .cornerRadius(5)
                                    .onTapGesture {
                                        selectedDate = day.date
                                    }
                            } else {
                                Text("")
                                    .frame(width: 40, height: 40)  // Empty cells for padding
                                    .padding(3)
                                    
                            }
                        } else {
                            Text("")
                                .frame(width: 40, height: 40)  // Empty cells for padding
                                .padding(3)
                                
                        }
                    }
                }
            }
        }
        .padding()
    }
    
    private func generateDaysInMonth(for date: Date) -> [Day] {
        guard let monthInterval = calendar.dateInterval(of: .month, for: date) else {
            return []
        }
        
        var days = [Day]()
        var currentDate = monthInterval.start
        
        while currentDate < monthInterval.end {
            let day = Day(
                number: calendar.component(.day, from: currentDate).description,
                date: currentDate
            )
            days.append(day)
            currentDate = calendar.date(byAdding: .day, value: 1, to: currentDate)!
        }
        
        // Add padding for the first week
        if let firstDay = days.first?.date, let weekday = calendar.dateComponents([.weekday], from: firstDay).weekday {
            let paddingDays = Array(repeating: Day(number: "", date: Date()), count: weekday - 1)
            days.insert(contentsOf: paddingDays, at: 0)
        }
        
        return days
    }
    
    private func isCurrentDate(_ date: Date) -> Bool {
        calendar.isDateInToday(date)
    }
    
    struct Day {
        let number: String
        let date: Date
    }
}


#Preview {
    EventsView()
}
