//
//  AuthDataManager.swift
//  FitMe
//
//  Created by Gairuka Bandara on 2024-11-12.
//

import SwiftUI
import Firebase
import FirebaseAuth

class AuthDataManager: ObservableObject {
    @Published var user: [TestUsers] = []
    
    init() {
        fetchUser()
    }
    
    func fetchUser() {
        user.removeAll()
        let db = Firestore.firestore()
        let ref = db.collection("users")
        ref.getDocuments { snapshot, error in
            guard error == nil else {
                print(error!.localizedDescription)
                return
            }
            
            if let snapshot = snapshot {
                for document in snapshot.documents {
                    let data = document.data()
                    let id = data["id"] as? String ?? ""
                    let name = data ["name"] as? String ?? ""
                    
                    let user = TestUsers(id: id, name: name)
                    self.user.append(user)
                }
            }
        }
    }
}

