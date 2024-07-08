//
//  DateFormatter.swift
//  HouseMate
//
//  Created by Simon Nguyen on 7/7/24.
//

import Foundation

// Define a function to format the date
func formatDate(_ date: Date) -> String {
    let dateFormatter = DateFormatter()
    // Set the date format
    dateFormatter.dateFormat = "E M/d"
    // Format the date to string
    return dateFormatter.string(from: date)
}


