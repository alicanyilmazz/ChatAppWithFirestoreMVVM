//
//  Error.swift
//  ChatAppWithFirestoreMVVM
//
//  Created by alican on 20.03.2022.
//

import Foundation

enum ValidationError : Error{
    case custom(message : String)
}
