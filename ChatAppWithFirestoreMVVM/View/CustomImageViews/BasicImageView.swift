//
//  CustomImageView.swift
//  ChatAppWithFirestoreMVVM
//
//  Created by alican on 24.03.2022.
//

import UIKit

class BasicImageView : UIImageView{

    init(imageViewConfiguration custom : BasicImageViewConfiguration){
        super.init(frame: .zero)
        image = UIImage(named: custom.imageName)
        tintColor = custom.tintColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class BasicImageViewConfiguration{
    let imageName : String
    let tintColor : UIColor
    
    init(imageName : String,tintColor : UIColor = .clear){
        self.imageName = imageName
        self.tintColor = tintColor
        
    }
}
