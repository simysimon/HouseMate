//
//  Household.swift
//  HouseMate
//
//  Created by Simon Nguyen on 7/8/24.
//

import Foundation


struct Household: Codable, Identifiable {
    
    let id: String
    let name: String
    var users: [String]
    var tasks: [String]
}
