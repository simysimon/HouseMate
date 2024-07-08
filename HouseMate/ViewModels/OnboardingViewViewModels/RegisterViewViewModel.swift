//
//  RegisterViewViewModel.swift
//  HouseMate
//
//  Created by Simon Nguyen on 7/7/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore



class RegisterViewViewModel: ObservableObject {
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
    
    
    init() {
    
    }
    
    func register() {
        guard validate() else {
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            guard let userId = result?.user.uid else {
                return
            }
            
            self?.insertUserRecord(id: userId)
        }
        
        
      //  Auth.auth().signIn(withEmail: email, password: password)

        
    }
    
    
    private func insertUserRecord(id: String) {
        let newUser = User(id: id,
                           name: name,
                           email: email,
                           joined: Date().timeIntervalSince1970,
                           household: "")
        
        let db = Firestore.firestore()
        
            
        db.collection("users")
            .document(newUser.id)
            .setData(newUser.asDictionary())
        print("user added to firestore")
    }
    
    private func validate() -> Bool {
        
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty,
              !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        
        
        guard email.contains("@") && email.contains(".") else {
            return false
        }
        
        
        guard password.count >= 6 else {
            return false
        }
        
        return true
    }
}
