//
//  Task.swift
//  HouseMate
//
//  Created by Simon Nguyen on 7/8/24.
//

import Foundation


struct TaskItem: Codable, Identifiable {
    
    let id: String
    let title: String
//    var users: [User]
//    let userPool: [[User]]
    let threshold: String
    var progress: String
    
  //  var isSingle: Bool
    var dueDate: TimeInterval
    
  //  var isConstant: Bool
  //  let interval: Int
 //   let days: [Int]
    
    
    func voteDone() {
        
    }
    
    func delete() {
        
    }
    
    
    
}
