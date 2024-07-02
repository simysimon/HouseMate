////
////  DataManager.swift
////  HouseMate
////
////  Created by Simon Nguyen on 6/27/24.
////
//
//import SwiftUI
//import Firebase
//
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
