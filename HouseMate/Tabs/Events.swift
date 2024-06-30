//
//  Events.swift
//  HouseMate
//
//  Created by Simon Nguyen on 6/21/24.
//

import Foundation
import SwiftUI

// Define the Event struct
struct Event: Hashable {
    let id = UUID()
    let date: Date
    let description: String
}

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
    
    func isWeekend() -> Bool {
            let calendar = Calendar.current
            let weekday = calendar.component(.weekday, from: self)
            return weekday == 1 || weekday == 7 // 1 = Sunday, 7 = Saturday
        }
}

struct EventsView: View {
    @State private var selectedOption: Int = 2
    @State private var isBell: Bool = false
    @State private var selectedDate: Date? = nil  // State to track the selected date
    @State private var currentMonth: Date = Date()  // State to track the current month

    // Placeholder for future user-created events
    @State private var events: [Event] = [
        Event(date: Calendar.current.date(byAdding: .day, value: -3, to: Date())!, description: "Deep Clean"),
        Event(date: Calendar.current.date(byAdding: .day, value: -3, to: Date())!, description: "Deep poo"),
        Event(date: Calendar.current.date(byAdding: .day, value: 3, to: Date())!, description: "House Meeting"),
        Event(date: Calendar.current.date(byAdding: .day, value: 5, to: Date())!, description: "Party")
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
                        let upcomingEvents = events.filter { event in
                            event.date >= Calendar.current.startOfDay(for: Date())
                        }

                        if upcomingEvents.isEmpty {
                            Text("No upcoming events")
                                .font(.headline)
                                .padding()
                        } else {
                            ScrollView {
                                VStack(spacing: 10) {
                                    ForEach(upcomingEvents.sorted(by: { $0.date < $1.date }), id: \.self) { event in
                                        VStack {
                                            HStack {
                                                Text("\(event.date.dayName()) \n \(event.date.monthDay())")
                                                    .font(.system(size: 11, weight: .bold, design: .default))
                                                    .foregroundColor(.white)
                                                    .multilineTextAlignment(.center)
                                                    .padding()
                                                    .frame(width: 98, height: 60)
                                                    .background(
                                                        RoundedRectangle(cornerRadius: 115)
                                                            .fill(event.date.isWeekend() ? Color(red: 0.0, green: 0.0, blue: 1.0) : Color.blue)
                                                            .frame(width: 98, height: 60)
                                                    )
                                                Spacer()
                                                
                                                VStack(alignment: .leading, spacing: 5) {
                                                    ForEach(events.filter { Calendar.current.isDate($0.date, inSameDayAs: event.date) }, id: \.self) { event in
                                                        RoundedRectangle(cornerRadius: 115)
                                                            .fill(Color.blue.opacity(0.2))
                                                            .frame(height: 20)
                                                            .overlay(
                                                                Text(event.description)
                                                                    .font(.system(size: 15))
                                                                    .foregroundColor(Color.blue.opacity(0.9))
                                                                    .padding()
                                                            )
                                                    }
                                                }
                                                .padding(.horizontal)
                                            }
                                            .padding()
                                            .background(Color(red: 0.8, green: 0.91, blue: 1.0, opacity: 1.0))
                                            .cornerRadius(115)
                                            .padding(.horizontal)
                                        }
                                    }
                                }
                            }
                        }
                    }
                }

                // Week
                else if selectedOption == 1 {
                    VStack {
                        // Create a dictionary that maps dates to a list of event descriptions
                        let eventsDict: [Date: [String]] = Dictionary(grouping: events) { $0.date }
                            .mapValues { $0.map { $0.description } }
                        
                        // Convert eventsDict to [Event]
                        let events = eventsDict.flatMap { (date, descriptions) -> [Event] in
                            descriptions.map { Event(date: date, description: $0) }
                        }

                        // Use WeekView with events array
                        WeekView(events: events)
                    
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
}


// Calendar
struct CalendarView: View {
    let events: [Event] // Array of event dates
    @Binding var selectedDate: Date?
    @Binding var currentMonth: Date  // Binding to track the current month
    let calendar = Calendar.current
    let dateFormatter: DateFormatter

    init(events: [Event], selectedDate: Binding<Date?>, currentMonth: Binding<Date>) {
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
                                ZStack {
                                    Text(day.number)
                                        .frame(width: 40, height: 40)
                                        .padding(3)
                                        .background(
                                            RoundedRectangle(cornerRadius: 5)
                                                .strokeBorder(Color.gray, lineWidth: selectedDate == day.date ? 2 : 0)
                                        )
                                        .foregroundColor(isCurrentDate(day.date) ? .red : .primary)
                                        .cornerRadius(5)
                                        .onTapGesture {
                                            selectedDate = day.date
                                        }
                                    
                                    if events.contains(where: { Calendar.current.isDate($0.date, inSameDayAs: day.date) }) {
                                        Circle()
                                            .fill(Color.gray)
                                            .frame(width: 6, height: 6)
                                            .offset(y: 15) // Adjust the offset as needed to position the dot
                                    }
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

// WeekView using placeholder events directly
struct WeekView: View {
    let events: [Event]

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
                                .font(.system(size: 11, weight: .bold, design: .default))
                                .foregroundColor(.white)
                                .multilineTextAlignment(.center)
                                .padding()
                                .frame(width: 98, height: 60)
                                .background(
                                    RoundedRectangle(cornerRadius: 115)
                                        .fill(day.isWeekend() ? Color(red: 0.0, green: 0.0, blue: 1.0) : Color.blue)
                                        .frame(width: 98, height: 60)
                                )
                            Spacer()
                            
                            VStack {
                                ForEach(events.filter { Calendar.current.isDate($0.date, inSameDayAs: day) }, id: \.self) { event in
                                    RoundedRectangle(cornerRadius: 115)
                                        .fill(Color.blue.opacity(0.2))
                                        .frame(height: 20)
                                        .overlay(
                                            Text(event.description)
                                                .font(.system(size: 15))
                                                .foregroundColor(Color.blue.opacity(0.9))
                                                .padding()
                                        )
    
                                }
                            }
                        }
                    }
                    .padding()
                    .background(Color(red: 0.8, green: 0.91, blue: 1.0, opacity: 1.0))
                    .cornerRadius(115)
                    .padding(.horizontal)
                }
            }
        }
    }
}


#Preview {
    EventsView()
}
