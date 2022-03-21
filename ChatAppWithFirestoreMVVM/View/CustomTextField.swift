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
        attributedPlaceholder = NSAttributedString(string: custom.placeholder,attributes: [NSAttributedString.Key.foregroundColor : custom.placeholderColor])
        keyboardAppearance = custom.keyboardAppearance
        keyboardType = custom.keyboardType
        borderStyle = custom.borderStyle
        isSecureTextEntry = custom.isSecureTextEntry
        font = UIFont.systemFont(ofSize: custom.fontSize)
        textColor = custom.textColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class CustomTextFieldConfiguration{
  let placeholder: String
  let isSecureTextEntry: Bool
  let fontSize : CGFloat
  let textColor: UIColor
  let placeholderColor : UIColor
  let keyboardAppearance: UIKeyboardAppearance
  let keyboardType: UIKeyboardType
  let borderStyle : UITextField.BorderStyle
    
    init(_placeholder: String , _isSecureTextEntry: Bool , _fontSize : CGFloat , _textColor: UIColor , _placeholderColor : UIColor , _keyboardAppearance: UIKeyboardAppearance , _keyboardType: UIKeyboardType , _borderStyle : UITextField.BorderStyle){
        placeholder = _placeholder
        isSecureTextEntry = _isSecureTextEntry
        fontSize = _fontSize
        textColor = _textColor
        placeholderColor = _placeholderColor
        keyboardAppearance = _keyboardAppearance
        keyboardType = _keyboardType
        borderStyle = _borderStyle
    }
    
    static let emailLoginTextField = CustomTextFieldConfiguration(_placeholder: "Email", _isSecureTextEntry: false, _fontSize: 14, _textColor: .white, _placeholderColor: .white, _keyboardAppearance: .dark, _keyboardType: .default, _borderStyle: .none)
    
    static let passwordLoginTextField = CustomTextFieldConfiguration(_placeholder: "Password", _isSecureTextEntry: true, _fontSize: 14, _textColor: .white, _placeholderColor: .white, _keyboardAppearance: .dark, _keyboardType: .default, _borderStyle: .none)
    
    static let fullnameLoginTextField = CustomTextFieldConfiguration(_placeholder: "Full Name", _isSecureTextEntry: false, _fontSize: 14, _textColor: .white, _placeholderColor: .white, _keyboardAppearance: .dark, _keyboardType: .default, _borderStyle: .none)
    
    static let usernameLoginTextField = CustomTextFieldConfiguration(_placeholder: "Username", _isSecureTextEntry: false, _fontSize: 14, _textColor: .white, _placeholderColor: .white, _keyboardAppearance: .dark, _keyboardType: .default, _borderStyle: .none)
}


