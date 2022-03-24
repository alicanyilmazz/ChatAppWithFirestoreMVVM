//
//  CustomTextButton.swift
//  ChatAppWithFirestoreMVVM
//
//  Created by alican on 24.03.2022.
//

import UIKit

class CustomTextButton : UIButton{

    init(textButtonConfiguration custom : CustomTextButtonConfiguration){
        super.init(frame: .zero)
        backgroundColor = custom.backgroundColor
        let attributedTitle = NSMutableAttributedString(string: "\(custom.firstTitle)  ",attributes: [.font : UIFont.systemFont(ofSize: custom.firstTitleFontSize),.foregroundColor: custom.firstTitleColor])
        attributedTitle.append(NSAttributedString(string: "\(custom.secondTitle)",attributes: [.font: UIFont.boldSystemFont(ofSize: custom.secondTitleFontSize),.foregroundColor: custom.secondTitleColor]))
        setAttributedTitle(attributedTitle, for: .normal)
        setHeight(height: custom.height)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class CustomTextButtonConfiguration{
    let firstTitle : String
    let secondTitle : String
    let firstTitleColor : UIColor
    let secondTitleColor : UIColor
    let firstTitleFontSize : CGFloat
    let secondTitleFontSize : CGFloat
    let backgroundColor : UIColor
    let height : CGFloat
    
    init(firstTitle : String,secondTitle : String,firstTitleColor : UIColor = .white,secondTitleColor : UIColor = .white,firstTitleFontSize : CGFloat = 13,secondTitleFontSize : CGFloat = 13,backgroundColor : UIColor = .clear,height : CGFloat = 45){
        self.firstTitle = firstTitle
        self.secondTitle = secondTitle
        self.firstTitleColor = firstTitleColor
        self.secondTitleColor = secondTitleColor
        self.firstTitleFontSize = firstTitleFontSize
        self.secondTitleFontSize = secondTitleFontSize
        self.backgroundColor = backgroundColor
        self.height = height
    }
}


