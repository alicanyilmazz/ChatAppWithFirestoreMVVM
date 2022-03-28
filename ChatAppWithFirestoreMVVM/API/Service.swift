//
//  Service.swift
//  ChatAppWithFirestoreMVVM
//
//  Created by alican on 27.03.2022.
//

import Firebase

struct Service{
    
    static func fetchUsers(completion: @escaping([User])-> Void){
        var users = [ User]()
        Firestore.firestore().collection("users").getDocuments { snapshot, error in
            if let error = error{
                print("DEBUG: Error with \(error)")
            }
            snapshot?.documents.forEach({ document in
                let dictionary = document.data()
                let user = User(dictionary: dictionary)
                users.append(user)
                completion(users)
            })
        }
    }
}
