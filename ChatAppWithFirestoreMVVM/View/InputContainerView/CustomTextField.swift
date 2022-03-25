//
//  CustomTextField.swift
//  ChatAppWithFirestoreMVVM
//
//  Created by alican on 19.03.2022.
//

import UIKit

class CustomTextField: UITextField{
    
    init(customTextFieldConfiguration custom : CustomTextFieldConfiguration){
        super.init(frame: .zero)
        keyboardAppearance = custom.keyboardAppearance
        keyboardType = custom.keyboardType
        borderStyle = custom.borderStyle
        font = UIFont.systemFont(ofSize: custom.fontSize)
        textColor = custom.textColor
        textContentType = .oneTimeCode
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class CustomTextFieldConfiguration{
  let fontSize : CGFloat
  let textColor: UIColor
  let placeholderColor : UIColor
  let keyboardAppearance: UIKeyboardAppearance
  let keyboardType: UIKeyboardType
  let borderStyle : UITextField.BorderStyle
    
    init(_fontSize : CGFloat , _textColor: UIColor , _placeholderColor : UIColor , _keyboardAppearance: UIKeyboardAppearance , _keyboardType: UIKeyboardType , _borderStyle : UITextField.BorderStyle){
        fontSize = _fontSize
        textColor = _textColor
        placeholderColor = _placeholderColor
        keyboardAppearance = _keyboardAppearance
        keyboardType = _keyboardType
        borderStyle = _borderStyle
    }
}
