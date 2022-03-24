//
//  Model.swift
//  ChatAppWithFirestoreMVVM
//
//  Created by alican on 20.03.2022.
//

import Foundation
import UIKit

final class FormSectionComponent : FormSectionItem, Hashable{
    let id: UUID = UUID()
    var components: [FormComponent]
    
    required init(components: [FormComponent]){
        self.components = components
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: FormSectionComponent, rhs: FormSectionComponent) -> Bool{
        lhs.id == rhs.id
    }
}

class FormComponent: FormItem,Hashable{
   
    let id = UUID()
    let sectionType: Int
    let componentType: Int
    var value: Any?
    var validations: [ValidationManager]
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: FormComponent, rhs: FormComponent) -> Bool{
        lhs.id == rhs.id
    }
    
    init(sectionType: Int,componentType : Int, validations: [ValidationManager] = []){
        self.sectionType = sectionType
        self.componentType = componentType
        self.validations = validations
    }
}

final class TextFormComponent: FormComponent{
    let leftIconImage: String
    let placeholderName: String
    let placeHolderColor: UIColor
    let isSecureTextEntry: Bool
    init(leftIconImage: String, placeholderName: String, placeHolderColor : UIColor, isSecureTextEntry: Bool, sectionType: Int,componentType : Int,validations: [ValidationManager] = []) {
        self.leftIconImage = leftIconImage
        self.placeholderName = placeholderName
        self.placeHolderColor = placeHolderColor
        self.isSecureTextEntry = isSecureTextEntry
        super.init(sectionType: sectionType, componentType: componentType,validations: validations)
    }
}

final class DateFormComponent: FormComponent{
    override init(sectionType: Int,componentType : Int,validations: [ValidationManager] = []){
        super.init(sectionType: sectionType, componentType: componentType,validations: validations)
    }
}

final class ButtonFormItem: FormComponent{
    init(sectionType: Int,componentType : Int){
        super.init(sectionType: sectionType, componentType: componentType)
    }
}

