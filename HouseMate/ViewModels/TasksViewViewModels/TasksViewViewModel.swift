//
//  TasksViewViewModel.swift
//  HouseMate
//
//  Created by Simon Nguyen on 7/7/24.
//

import Foundation
import FirebaseFirestore
import Combine

class TasksViewViewModel: ObservableObject {
    @Published var showingCreateTaskView = false
    @Published var isMyTaskSelected = true
    @Published var isWeekSelected = true
    
    @Published var household: String = "household"

    private let userId: String

    
    init(userId: String) {
        self.userId = userId
        Task {
            await fetchHousehold(userId: userId)
        }
    }

    
    

    func fetchHousehold(userId: String) async -> Void {
        do {
          
            // Fetch the household and save the task to the household's task list
            if let householdValue = try await fetchFieldFromDocument(collectionName: "users", documentID: userId, fieldName: "household") as? String {
                self.household = householdValue
                print(householdValue)

                return
            } else {
                print("No household found")
                return
            }
        } catch {
            print("Error: \(error.localizedDescription)")
            return
        }
    }
    
    
    
    
    
    
    
    
    func delete(id: String) {
        let db = Firestore.firestore()
        
        
        db.collection("users")
            .document(userId)
            .collection("tasks")
            .document(id)
            .delete()
    }
    
    
    
    
    
    
}
