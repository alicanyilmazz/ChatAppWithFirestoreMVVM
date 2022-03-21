//
//  LoginViewModel.swift
//  ChatAppWithFirestoreMVVM
//
//  Created by alican on 20.03.2022.
//

import Foundation

struct loginViewModel{
    var email: String?
    var password: String?
    
    var formIsValid: Bool{
        return email?.isEmpty == false && password?.isEmpty == false
    }
}
