//
//  fetchFieldFromDoc.swift
//  HouseMate
//
//  Created by Simon Nguyen on 7/9/24.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

//func fetchFieldFromDocument(collectionName: String, documentID: String, fieldName: String, completion: @escaping (Any?, Error?) -> Void) {
//    let db = Firestore.firestore()
//    let docRef = db.collection(collectionName).document(documentID)
//
//    docRef.getDocument { (document, error) in
//        if let error = error {
//            completion(nil, error)
//            return
//        }
//        
//        
//        if let document = document {
//            
//            DispatchQueue.main.async{
//                let fieldValue = document.get(fieldName)
//                completion(fieldValue, nil)
//            }
//            
//        } else {
//            completion(nil, NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Document does not exist"]))
//        }
//        
//    }
//}


func fetchFieldFromDocument(collectionName: String, documentID: String, fieldName: String) async throws -> Any? {
    let db = Firestore.firestore()
    let docRef = db.collection(collectionName).document(documentID)

    let document = try await docRef.getDocument()
    return document.get(fieldName)
}

//func fetchHousehold() {
//    let db = Firestore.firestore()
//    let docRef = db.collection("users")
//    
//    docRef.getDocuments { snapshot, error in
//        guard error == nil else {
//            print(error!.localizedDescription)
//            return
//        }
//        if let snapshot = snapshot {
//            for document in snapshot.documents {
//                let data = document.data()
//                
//                let
//            }
//        }
//        
//    }
//}






