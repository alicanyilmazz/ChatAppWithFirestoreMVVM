//
//  CustomImageView.swift
//  ChatAppWithFirestoreMVVM
//
//  Created by alican on 21.03.2022.
//

import UIKit

class CustomImageView: UIImageView{
    init(customTextFieldConfiguration custom : CustomImageViewConfiguration){
        super.init(frame: .zero)
        tintColor = custom.tintColor
        alpha = custom.alpha
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class CustomImageViewConfiguration{
    let tintColor: UIColor
    let alpha: CGFloat
    
    init(_tintColor: UIColor , _alpha : CGFloat){
       tintColor = _tintColor
       alpha = _alpha
    }
}


