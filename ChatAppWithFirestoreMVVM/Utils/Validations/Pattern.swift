//
//  Pattern.swift
//  ChatAppWithFirestoreMVVM
//
//  Created by alican on 20.03.2022.
//

import Foundation

enum RegexPatterns{
    static let emailChars = ".*[@].*"
    static let higherThanSixChars = "^.{6,}$"
    static let name = "^[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$"
}
