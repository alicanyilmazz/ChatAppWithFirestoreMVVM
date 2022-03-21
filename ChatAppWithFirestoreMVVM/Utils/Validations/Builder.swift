//
//  Builder.swift
//  ChatAppWithFirestoreMVVM
//
//  Created by alican on 20.03.2022.
//

import Foundation

final class formComponentBuilderImpl{
    private(set) var formContent = [
        FormSectionComponent(items: [
            TextFormComponent(sectionType: ComponentSectionType.loginSection.rawValue, componentType: ComponentSectionType.LoginComponentType.email.rawValue,validations: [RegexValidationManagerImpl([RegexFormItem(pattern: RegexPatterns.name, error: .custom(message: "Invalid Name Entered"))])]),
            TextFormComponent(sectionType: ComponentSectionType.loginSection.rawValue, componentType: ComponentSectionType.LoginComponentType.password.rawValue,validations: [RegexValidationManagerImpl([RegexFormItem(pattern: RegexPatterns.name, error: .custom(message: "Invalid Last Name Entered"))])]),
            ButtonFormItem(sectionType: ComponentSectionType.loginSection.rawValue, componentType: ComponentSectionType.LoginComponentType.email.rawValue)
        ]),
        FormSectionComponent(items: [
            TextFormComponent(sectionType: ComponentSectionType.registerSection.rawValue, componentType: ComponentSectionType.RegisterComponentType.email.rawValue,validations: [RegexValidationManagerImpl([RegexFormItem(pattern: RegexPatterns.name, error: .custom(message: "Invalid Name Entered"))])]),
            TextFormComponent(sectionType: ComponentSectionType.registerSection.rawValue, componentType: ComponentSectionType.RegisterComponentType.password.rawValue,validations: [RegexValidationManagerImpl([RegexFormItem(pattern: RegexPatterns.name, error: .custom(message: "Invalid Last Name Entered"))])]),
            TextFormComponent(sectionType: ComponentSectionType.registerSection.rawValue, componentType: ComponentSectionType.RegisterComponentType.fullname.rawValue,validations: [RegexValidationManagerImpl([RegexFormItem(pattern: RegexPatterns.name, error: .custom(message: "Invalid Last Name Entered"))])]),
            TextFormComponent(sectionType: ComponentSectionType.registerSection.rawValue, componentType: ComponentSectionType.RegisterComponentType.username.rawValue,validations: [RegexValidationManagerImpl([RegexFormItem(pattern: RegexPatterns.name, error: .custom(message: "Invalid Last Name Entered"))])]),
            ButtonFormItem(sectionType: ComponentSectionType.registerSection.rawValue, componentType: ComponentSectionType.RegisterComponentType.email.rawValue)
        ])
    ]
    
    func update(val: Any , at indexPath: IndexPath){
        formContent[indexPath.section].items[indexPath].value = val
    }
    
    func validate(){
        do {
            let formComponents = formContent.flatMap{$0.items}.filter{$0.formId != .submit}
            for component in formComponents {
                for validator in component.validations{
                    try validator.validate(component.value as Any)
                }
            }
            let validValues = formComponents.map{($0.formId.rawValue,$0.value)}
            let validDict = Dictionary(uniqueKeysWithValues: validValues) as [String : Any]
            
            // Passthrough here
            //user.send(validDict)
        } catch  {
            print("Something is wrong with form \(error)")
        }
    }
}
