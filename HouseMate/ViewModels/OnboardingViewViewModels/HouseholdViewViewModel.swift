//
//  HouseholdViewViewModel.swift
//  HouseMate
//
//  Created by Simon Nguyen on 7/8/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class HouseholdViewViewModel: ObservableObject {
    @Published var isJoinedHousehold = false
    
    @Published var householdID = ""
    @Published var isJoin: Bool = true
    @Published var errorMessage = ""
    @Published var isHouseholdExists = false
    
    @Published var name = ""
    @Published var groups = ""
    
    var users: [String] = []
    var tasks: [String] = []
    
    private var db = Firestore.firestore()
    
    init() {
        
    }
    
    func checkHouseholdExists() {
            let docRef = db.collection("households").document(householdID)
            
            docRef.getDocument { (document, error) in
                if let error = error {
                    DispatchQueue.main.async {
                        self.errorMessage = "Error checking household: \(error.localizedDescription)"
                        print(self.errorMessage)
                    }
                } else if let document = document, document.exists {
                    DispatchQueue.main.async {
                        self.isHouseholdExists = true
                        self.errorMessage = ""
                        print("isHouseholdExists = \(self.isHouseholdExists)")
                    }
                } else {
                    DispatchQueue.main.async {
                        self.isHouseholdExists = false
                        self.errorMessage = "Household UID does not exist."
                        print(self.errorMessage)
                    }
                }
            }
        }
    
    func joinHousehold() {
        guard let uId = Auth.auth().currentUser?.uid else {
            return
        }

        //add user to household
        
        let householdDocRef = db.collection("households").document(householdID)
        householdDocRef.updateData(["users": FieldValue.arrayUnion([uId])]) { error in
            if let error = error {
                print("Error updating household document: \(error)")
            } else {
                print("household document successfully updated")
                // Optionally fetch the updated document to reflect changes in the UI
               
            }
        }
        
        
        
        //add household to user
        let userDocRef = db.collection("users").document(uId)
        userDocRef.updateData(["household": self.householdID]) { error in
            if let error = error {
                print("Error updating user document: \(error)")
            } else {
                print("user document successfully updated")
                // Optionally fetch the updated document to reflect changes in the UI
               
            }
        }
        
        
        
        
    }
    
    
    
    
    func toggleIsJoin() {
        isJoin.toggle()
    }
    func toggleIsJoinedHousehold() {
        isJoinedHousehold.toggle()
    }
    
    func createHousehold() {
        guard let uId = Auth.auth().currentUser?.uid else {
            return
        }
        users.append(uId)
        
        let newId = UUID().uuidString
        
        let newHousehold = Household(id: newId, name: name, users: users, tasks: tasks)
        
        
        db.collection("households")
            .document(newId)
            .setData(newHousehold.asDictionary())
            
        let docRef = db.collection("users").document(uId)

        docRef.updateData(["household": newId]) { error in
                    if let error = error {
                        print("Error updating document: \(error)")
                    } else {
                        print("Document successfully updated")
                        // Optionally fetch the updated document to reflect changes in the UI
                       
                    }
                }
            
        
    }
    
}
