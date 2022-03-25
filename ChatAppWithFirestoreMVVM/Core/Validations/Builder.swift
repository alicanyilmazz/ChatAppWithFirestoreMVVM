//
//  Builder.swift
//  ChatAppWithFirestoreMVVM
//
//  Created by alican on 20.03.2022.
//

import Foundation
import UIKit

final class ComponentBuilder{
    
    static let shared = ComponentBuilder()
    
    private init(){}
    
    private(set) var content = [
        FormSectionComponent(components: [
            TextFormComponent(leftIconImage:"ic_mail_outline_white_2x",placeholderName: "Email",placeHolderColor: .white,isSecureTextEntry: false ,sectionType: ComponentSectionType.loginSection.rawValue, componentType: ComponentSectionType.LoginComponentType.email.rawValue,validations: [RegexValidationManagerImpl([RegexFormItem(pattern: RegexPatterns.between3to20, error: .custom(message: "Character length must be between 3-20.")),RegexFormItem(pattern: RegexPatterns.email, error: .custom(message: "Invalid email format."))])]),
            TextFormComponent(leftIconImage:"ic_lock_outline_white_2x",placeholderName: "Password",placeHolderColor: .white,isSecureTextEntry: true ,sectionType: ComponentSectionType.loginSection.rawValue, componentType: ComponentSectionType.LoginComponentType.password.rawValue,validations: [RegexValidationManagerImpl([RegexFormItem(pattern: RegexPatterns.standartPassword, error: .custom(message: "At least one uppercase,one number and length 8-15"))])])
        ]),
        FormSectionComponent(components: [
            TextFormComponent(leftIconImage:"ic_mail_outline_white_2x",placeholderName: "Email",placeHolderColor: .white,isSecureTextEntry: false ,sectionType: ComponentSectionType.registerSection.rawValue, componentType: ComponentSectionType.RegisterComponentType.email.rawValue,validations: [RegexValidationManagerImpl([RegexFormItem(pattern: RegexPatterns.between3to20, error: .custom(message: "Character length must be between 3-20.")),RegexFormItem(pattern: RegexPatterns.email, error: .custom(message: "Invalid email format."))])]),
            TextFormComponent(leftIconImage:"ic_lock_outline_white_2x",placeholderName: "Password",placeHolderColor: .white,isSecureTextEntry: true ,sectionType: ComponentSectionType.registerSection.rawValue, componentType: ComponentSectionType.RegisterComponentType.password.rawValue,validations: [RegexValidationManagerImpl([RegexFormItem(pattern: RegexPatterns.standartPassword, error: .custom(message: "At least one uppercase,one number and length 8-15"))])]),
            TextFormComponent(leftIconImage:"ic_person_outline_white_2x",placeholderName: "Name",placeHolderColor: .white,isSecureTextEntry: false ,sectionType: ComponentSectionType.registerSection.rawValue, componentType: ComponentSectionType.RegisterComponentType.fullname.rawValue,validations: [RegexValidationManagerImpl([RegexFormItem(pattern: RegexPatterns.between3to15, error: .custom(message: "Character length must be between 3-15.")),RegexFormItem(pattern: RegexPatterns.alphabetic, error: .custom(message: "You can only enter alphabetic characters."))])]),
            TextFormComponent(leftIconImage:"ic_person_outline_white_2x",placeholderName: "Username",placeHolderColor: .white,isSecureTextEntry: false ,sectionType: ComponentSectionType.registerSection.rawValue, componentType: ComponentSectionType.RegisterComponentType.username.rawValue,validations: [RegexValidationManagerImpl([RegexFormItem(pattern: RegexPatterns.between3to15, error: .custom(message: "Character length must be between 3-15.")),RegexFormItem(pattern: RegexPatterns.alphabetic, error: .custom(message: "You can only enter alphabetic characters."))])])
        ])
    ]
    
    func getData(componentSectionType: Int) -> [String]{
        let formComponents = content[componentSectionType].components
        var data : [String] = [String]()
        for component in formComponents {
            data.append(component.value as! String)
        }
        return data
    }
    
    func update(val: Any , componentSectionType: Int , componentType: Int){
       content[componentSectionType].components[componentType].value = val
    }
    
    func validate(componentSectionType: Int) -> Bool{
        do {
            let formComponents = content[componentSectionType].components
            for component in formComponents {
                for validator in component.validations{
                    try validator.validate(component.value as Any)
                }
            }
            return true
        } catch  {
            return false
        }
    }
}
