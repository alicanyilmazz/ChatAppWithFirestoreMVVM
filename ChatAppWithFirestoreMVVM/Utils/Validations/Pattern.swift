//
//  Pattern.swift
//  ChatAppWithFirestoreMVVM
//
//  Created by alican on 20.03.2022.
//

import Foundation

enum RegexPatterns{
    static let email = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{3,64}"
    static let between3to20 = "^.{3,20}$"
    static let alphabetic = "^[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$"
    static let between3to15 = "^.{3,15}$"
    static let standartPassword = "^(?=.*[a-z])(?=.*[0-9])(?=.*[A-Z]).{8,15}$"
    static let advancePassword = "^(?=.*[A-Z].*[A-Z])(?=.*[!@#$&*])(?=.*[0-9].*[0-9])(?=.*[a-z].*[a-z].*[a-z]).{8}$"
}

/*

 Advance Password Rules :
 
 ^                         Start anchor
 (?=.*[A-Z].*[A-Z])        Ensure string has two uppercase letters.
        None               Ensure string has one special case letter.
 (?=.*[0-9].*[0-9])        Ensure string has two digits.
 (?=.*[a-z].*[a-z].*[a-z]) Ensure string has three lowercase letters.
 .{8}                      Ensure string is of length 8.
 $                         End anchor.
 
 
 Standart Password Rules :
 
 ^                                Start anchor
 (?=.*[A-Z])                      Ensure string has one uppercase letters.
        None                      Ensure string has one special case letter.
 (?=.*[0-9].*[0-9])               Ensure string has two digits.
 (?=.*[a-z].*[a-z].*[a-z].*[a-z]) Ensure string has four lowercase letters.
 .{8}                             Ensure string is of length 8.
 $                                End anchor.
 
 */
//Alica!21 
