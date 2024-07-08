//
//  DataManager.swift
//  HouseMate
//
//  Created by Simon Nguyen on 6/27/24.
//

import SwiftUI
import Firebase
import FirebaseFirestore



//func saveUser(user: User) {
//    let db = Firestore.firestore()
//    do {
//        try db.collection("users").document(user.id.uuidString).setData(from: user)
//    } catch let error {
//        print("Error writing user to Firestore: \(error)")
//    }
//}
//
//func saveHousehold(household: Household) {
//    let db = Firestore.firestore()
//    do {
//        try db.collection("households").document(household.id.uuidString).setData(from: household)
//    } catch let error {
//        print("Error writing household to Firestore: \(error)")
//    }
//}

//func saveHousehold(household: Household) {
//    let db = Firestore.firestore()
//    do {
//        // Save household document
//        try db.collection("households").document(household.id.uuidString).setData(from: household)
//        
//        // Save subcollections
//        for user in household.users {
//            try db.collection("households")
//                .document(household.id.uuidString)
//                .collection("users")
//                .document(user.id.uuidString)
//                .setData(from: user)
//        }
//        
//        // Similarly save tasks, expenses, and events
//    } catch let error {
//        print("Error writing household to Firestore: \(error)")
//    }
//}




















//class DataManager: ObservableObject {
//    @Published var users: [User] = []
//    
//    init() {
//        fetchUsers()
//    }
//    
//    
//    func fetchUsers() {
//        users.removeAll()
//        let db = Firestore.firestore()
//        let ref = db.collection("Users")
//        ref.getDocuments{snapshot, error in
//            guard error == nil else {
//                print(error!.localizedDescription)
//                return
//            }
//            
//            if let snapshot = snapshot {
//                for document in snapshot.documents {
//                    let data = document.data()
//                    
//                    let id = data["id"] as? String ?? ""
//                    let name = data["name"] as? String ?? ""
//                    
//                    let user = User(name: name, tasks: [], threshold: 3, isSingle: true, isConstant: false, interval: "Week", days: [])
//                    self.users.append(user)
//                }
//            }
//        }
//    }
//    
//}
//
//
//struct ListView : View {
//    @EnvironmentObject var dataManager: DataManager
//    
//    var body: some View {
//        NavigationView {
//            List(dataManager.users, id: \.id) { user in
//                Text(user.name)
//            }
//            .navigationTitle("Users")
//            .navigationBarItems(trailing: Button(action: {
//                //add
//                
//                
//            }, label: {
//                Image(systemName: "plus")
//            }))
//        }
//    }
//}
//
//func addUser() {
//    let db = Firestore.firestore()
//    do {
//        try await db.collection("Users").document("test").setData([
//            "name": "test"
//            "tasks": []
//            "threshold": 3
//            "isSingle": true
//            "isConstant": false
//            "interval": "Week"
//            "days": []
//        ])
//        print("Document successfully written!")
//    } catch {
//        print("Error writing document: \(error)")
//    }
//}
//
//
//
//struct ListView_Previews: PreviewProvider {
//    static var previews: some View {
//        ListView()
//            .environmentObject(DataManager())
//    }
//}
