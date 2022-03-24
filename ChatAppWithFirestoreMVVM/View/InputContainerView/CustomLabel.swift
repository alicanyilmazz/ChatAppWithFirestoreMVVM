//
//  CustomLabel.swift
//  ChatAppWithFirestoreMVVM
//
//  Created by alican on 21.03.2022.
//

import UIKit

class CustomLabel: UILabel{
    init(customTextFieldConfiguration custom : CustomLabelConfiguration){
        super.init(frame: .zero)
        font = font.withSize(custom.fontSize)
        textColor = custom.textColor
        textAlignment = custom.textAlignment
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class CustomLabelConfiguration{
    let textColor: UIColor
    let fontSize: CGFloat
    let textAlignment : NSTextAlignment
    
    init(_textColor: UIColor , _fontSize : CGFloat , _textAlignment: NSTextAlignment){
        textColor = _textColor
        fontSize = _fontSize
        textAlignment = _textAlignment
    }
}
