//
//  CreateTaskViewViewModel.swift
//  HouseMate
//
//  Created by Simon Nguyen on 7/7/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class CreateTaskViewViewModel: ObservableObject {
    
    @Published var title = ""
    //@Published var users = []
    @Published var threshold = ""
    @Published var progress = ""
    //@Published var isSingle = true
    @Published var dueDate = Date()
    
   // @Published var isConstant = false
   // @Published var interval = 0
   // @Published var days = [0]
    
    @Published var showAlert = false
    
    @Published var household: String = "household"
    
    
    init() {

    }
    
    
    func save() async -> Bool {
        //verify inputs are valid
        guard canSave else {
            return false
        }
        //get current user id
        guard let uId = Auth.auth().currentUser?.uid else {
            return false
        }
        
        //create new task object
        let newId = UUID().uuidString
        let newTask = TaskItem(id: newId, title: title, threshold: threshold, progress: progress, dueDate: dueDate.timeIntervalSince1970)
        
        
        let db = Firestore.firestore()
        
        //save new task to users task list
        do {
            try await db.collection("users")
                .document(uId)
                .collection("tasks")
                .document(newId)
                .setData(newTask.asDictionary())
            
            // Fetch the household and save the task to the household's task list
            if let householdValue = try await fetchFieldFromDocument(collectionName: "users", documentID: uId, fieldName: "household") as? String {
                self.household = householdValue
                
                try await db.collection("households")
                    .document(householdValue)
                    .collection("tasks")
                    .document(newId)
                    .setData(newTask.asDictionary())
                
                print("Household task saved: \(self.household)")
                return true
            } else {
                print("No household found")
                return false
            }
        } catch {
            print("Error: \(error.localizedDescription)")
            return false
        }
        
        
    }
    
    
    var canSave: Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        guard dueDate >= Date().addingTimeInterval(-86400) else {
            return false
        }
        
        return true
    }
    
    


    
}
