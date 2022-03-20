//
//  InputContainerView.swift
//  ChatAppWithFirestoreMVVM
//
//  Created by alican on 18.03.2022.
//

import UIKit

class InputContainerView : UIView{
    init(textField : UITextField ,inputContainerViewConfiguration input: InputContainerViewConfiguration){
        super.init(frame: .zero)
        
        setHeight(height: input.containerHeight)
        
        let imageView = UIImageView()
        imageView.image = input.icon
        imageView.tintColor = input.iconTintColor
        imageView.alpha = input.iconAlpha
        
        addSubview(imageView)
        imageView.centerY(inView: self)
        imageView.anchor(left: leftAnchor, paddingLeft: 8)
        imageView.setDimensions(height: 20, width: 20)
        
        addSubview(textField)
        textField.centerY(inView: self)
        textField.anchor(left: imageView.rightAnchor , bottom: bottomAnchor , right: rightAnchor , paddingLeft: 8 , paddingBottom: -8)
        
        let dividerView = UIView()
        dividerView.backgroundColor = input.dividerBackgroundColor
        addSubview(dividerView)
        dividerView.anchor(left: leftAnchor,bottom: bottomAnchor,right: rightAnchor,paddingLeft: 8,paddingRight: 8,height: 0.75)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class InputContainerViewConfiguration{
  let containerHeight: CGFloat
  let icon: UIImage
  let iconTintColor: UIColor
  let iconAlpha: CGFloat
  let dividerBackgroundColor : UIColor
    
    init(_containerHeight: CGFloat , _icon: UIImage , _iconTintColor: UIColor , _iconAlpha: CGFloat , _dividerBackgroundColor : UIColor){
       containerHeight = _containerHeight
       icon = _icon
       iconTintColor = _iconTintColor
       iconAlpha = _iconAlpha
       dividerBackgroundColor = _dividerBackgroundColor
    }
    
    static let emailInputContainerViewConfiguration = InputContainerViewConfiguration(_containerHeight: 50, _icon:  #imageLiteral(resourceName: "ic_mail_outline_white_2x"), _iconTintColor: UIColor(red: 78/255, green: 80/255, blue: 88/255, alpha: 1), _iconAlpha: 0.88, _dividerBackgroundColor: UIColor(red: 78/255, green: 80/255, blue: 88/255, alpha: 1))
    
    static let passwordInputContainerViewConfiguration =  InputContainerViewConfiguration(_containerHeight: 50, _icon:  #imageLiteral(resourceName: "ic_lock_outline_white_2x"), _iconTintColor: UIColor(red: 78/255, green: 80/255, blue: 88/255, alpha: 1), _iconAlpha: 0.88, _dividerBackgroundColor: UIColor(red: 78/255, green: 80/255, blue: 88/255, alpha: 1))
}

