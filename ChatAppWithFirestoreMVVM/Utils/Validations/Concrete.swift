//
//  Concrete.swift
//  ChatAppWithFirestoreMVVM
//
//  Created by alican on 20.03.2022.
//

import Foundation

protocol FormItem{
    var id: UUID {get}
    var componentType: Int {get}
    var sectionType: Int {get}
    var validations: [ValidationManager] {get}
}

protocol FormSectionItem{
    var id : UUID {get}
    var items: [FormComponent] {get}
    init(items: [FormComponent])
}


enum ComponentSectionType : Int{
    case loginSection = 0
    case registerSection = 1
    
    enum LoginComponentType : Int{
            case email = 0
            case password = 1
    }
    
    enum RegisterComponentType : Int {
            case email = 0
            case fullname = 1
            case username = 2
            case password = 3
    }
}
