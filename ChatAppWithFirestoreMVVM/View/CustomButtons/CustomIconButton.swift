//
//  CustomIconButton.swift
//  ChatAppWithFirestoreMVVM
//
//  Created by alican on 24.03.2022.
//

import UIKit

class CustomIconButton : UIButton{

    init(iconButtonConfiguration custom : CustomIconButtonConfiguration){
        super.init(frame: .zero)
        setImage(custom.image.withRenderingMode(.alwaysTemplate), for: .normal)
        tintColor = custom.tintColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class CustomIconButtonConfiguration{
    let image : UIImage
    let tintColor : UIColor
    
    init(image : UIImage,tintColor : UIColor = .white){
        self.image = image
        self.tintColor = tintColor
    }
}

