//
//  RegisterViewModel.swift
//  ChatAppWithFirestoreMVVM
//
//  Created by alican on 23.03.2022.
//

import Foundation

struct RegisterViewModel{
    var email: String
    var password : String
    var username : String
    var fullName : String
    
    init(email: String, password: String,fullName:String,username: String){
        self.email = email
        self.password = password
        self.fullName = fullName
        self.username = username
    }
}
