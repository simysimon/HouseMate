//
//  Objects.swift
//  HouseMate
//
//  Created by Simon Nguyen on 6/26/24.
//

import Foundation
import SwiftUI
import Firebase

class User: Codable, Identifiable {
    var id: UUID
    var name: String
    var tasks: [Task]
    var expenses: [Expense]
    var events: [Event]

    
    init(name: String) {
        self.id = UUID()
        self.name = name
        self.tasks = []
        self.expenses = []
        self.events = []
    }
    
    
}
//    var threshold: Int
//    var progress: Int
//    var isSingle: Bool //single vs recurring
//    var isConstant: Bool //only applicable to recurring tasks: constant vs singular
//    var interval: String //only applicable to recurring tasks
//    var days: [String] //only applicable to
//

protocol TaskProtocol: Identifiable, Codable {
    var id: UUID { get }
    var name: String { get }
    var users: [User] { get }
    var threshold: Int { get }
    var progress: Int { get }
}

class Task: TaskProtocol {
    var id: UUID
    var name: String
    var users: [User]
    var threshold: Int
    var progress: Int
    
    
    
    init(name: String, users: [User], threshold: Int) {
        self.id = UUID()
        self.name = name
        self.users = users
        self.threshold = threshold
        self.progress = 0
    }
    
    
}



class singleTask: Task {
    var date: Date

    init(name: String, users: [User], threshold: Int, date: Date) {
        self.date = date
        super.init(name: name, users: users, threshold: threshold)
    }
    
    required init(from decoder: any Decoder) throws {
        fatalError("init(from:) has not been implemented")
    }
}


//class recurringConstantTask: Task {
//    var interval: Int
//
//    init(name: String, users: [User], threshold: Int, interval: ) {
//        self.name = name
//    }
//}

//class recurringSingularTask: Task {
//    interval
//    days
//
//    init(name: String) {
//        self.name = name
//    }
//
//
//}








class Expense: Codable, Identifiable  {
    var id: UUID
    var name: String
    
    
    init(name: String) {
        self.id = UUID()
        self.name = name
    }
    
    
}
class Event: Codable, Identifiable  {
    var id: UUID
    var name: String
    
    
    init(name: String) {
        self.id = UUID()
        self.name = name
    }
    
    
}




class Household: Codable, Identifiable {
    var id: UUID
    var name: String
    var groups: [String]
    var users: [User]
    
    
    init(name: String, groups: [String]) {
        self.id = UUID()
        self.name = name
        self.groups = groups
        self.users = []
    }

}





//-------------------------------------------------------------------------------


struct Notification : View {
    
    var title: String
    var time: String
    
    var body : some View {
        
        VStack (alignment: .leading){
            Text(time)
                .font(.system(size: 14, design: .default))
                .foregroundColor(Color("accent"))
                .padding(.leading, 10)
                .padding(.top, -10)
                
                
                
            Text(title)
                .font(.system(size: 15, weight: .bold, design: .default))
                .bold()
                .foregroundColor(Color("text"))
                .padding(.leading)
                .padding(.top, -5)
                
                
            
        }
        .frame(width: 200, height: 60, alignment: .leading)
        .background(Color("sec"))
        .clipShape(RoundedRectangle(cornerRadius: 20))
        
    }
}
struct TaskCard : View {
    let task: any TaskProtocol
    //var title: String
    var date: String
    //var threshold: Int

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
                Text(task.name)
                    .font(.system(size: 23, weight: .semibold))
                    .foregroundColor(Color("text"))
                    .padding(.top)
                    .padding(.leading, -10)
                    .frame(maxWidth: .infinity, maxHeight: 80, alignment: .topLeading)
                Spacer()
                
                
                
                HStack {
                    ForEach(0..<task.threshold, id: \.self) { _ in
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
