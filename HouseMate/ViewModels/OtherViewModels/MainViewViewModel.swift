//
//  MainViewViewModel.swift
//  HouseMate
//
//  Created by Simon Nguyen on 7/7/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class MainViewViewModel: ObservableObject {
    @Published var currentUserId: String = ""
    @Published var household: String = ""

    
    private var handler: AuthStateDidChangeListenerHandle?
    
    init() {
        self.handler = Auth.auth().addStateDidChangeListener { [weak self] _, user in
            DispatchQueue.main.async {
                self?.currentUserId = user?.uid ?? ""
                print("User ID: \(self?.currentUserId ?? "No user")")
                self?.fetchHousehold()

            }
        }
    }
    
    public var isSignedIn: Bool {
        let signedIn = Auth.auth().currentUser != nil
        print("Is Signed In: \(signedIn)")
        return signedIn

    }
    
    public var isJoinedHousehold: Bool {
        return !household.isEmpty
    }
    
    func fetchHousehold() {
            guard let uId = Auth.auth().currentUser?.uid else {
                self.household = ""
                return
            }
            
            let db = Firestore.firestore()
            let docRef = db.collection("users").document(uId)
            
            docRef.getDocument { (document, error) in
                if let document = document, document.exists {
                    DispatchQueue.main.async {
                        self.household = document.get("household") as? String ?? ""
                    }
                } else {
                    DispatchQueue.main.async {
                        self.household = ""
                    }
                }
            }
        }
}
