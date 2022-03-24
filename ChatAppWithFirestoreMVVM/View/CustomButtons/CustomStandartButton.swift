//
//  CustomButton.swift
//  ChatAppWithFirestoreMVVM
//
//  Created by alican on 22.03.2022.
//

import UIKit

class CustomStandartButton : UIButton{

    init(standartButtonConfiguration custom : CustomStandartButtonConfiguration){
        super.init(frame: .zero)
        setTitle(custom.title, for: .normal)
        layer.cornerRadius = custom.cornerRadius
        titleLabel?.font = UIFont.boldSystemFont(ofSize: custom.fontSize)
        tintColor = custom.tintColor
        backgroundColor = UIColor(red: 84/255, green: 104/255, blue: 255/255, alpha: 1)
        setHeight(height: custom.height)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class CustomStandartButtonConfiguration{
    let title : String
    let cornerRadius : CGFloat
    let fontSize : CGFloat
    let tintColor : UIColor
    let backgroundColor : UIColor
    let height : CGFloat
    
    init(title : String,cornerRadius : CGFloat = 5 ,fontSize : CGFloat = 14,tintColor : UIColor = .white ,backgroundColor : UIColor = UIColor(red: 84/255, green: 104/255, blue: 255/255, alpha: 1),height : CGFloat = 45){
        self.title = title
        self.cornerRadius = cornerRadius
        self.fontSize = fontSize
        self.tintColor = tintColor
        self.backgroundColor = backgroundColor
        self.height = height
    }
}

