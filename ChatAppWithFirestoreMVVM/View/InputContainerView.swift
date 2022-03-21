//
//  InputContainerView.swift
//  ChatAppWithFirestoreMVVM
//
//  Created by alican on 18.03.2022.
//

import UIKit

class InputContainerView : UIView{
    
    private var textFormComponent: TextFormComponent?
        
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
        
        let warningLabel = UILabel()
        warningLabel.textColor = #colorLiteral(red: 0.1921568662, green: 0.007843137719, blue: 0.09019608051, alpha: 1)
        warningLabel.font = UIFont.systemFont(ofSize: 9)
        warningLabel.text = "Email format is not valid."
        
        addSubview(warningLabel)
        warningLabel.anchor(left: leftAnchor,bottom: bottomAnchor,right: rightAnchor,paddingLeft: 8,paddingBottom: 0,paddingRight: 8,height: 11)
        
        let dividerView = UIView()
        dividerView.backgroundColor = input.dividerBackgroundColor
        
        addSubview(dividerView)
        dividerView.anchor(left: leftAnchor,bottom: warningLabel.topAnchor,right: rightAnchor,paddingLeft: 8,paddingBottom: 4,paddingRight: 8,height: 0.75)
        
        addSubview(textField)
        textField.centerY(inView: self)
        textField.anchor(left: imageView.rightAnchor , right: rightAnchor , paddingLeft: 8)
        
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
    
    static let emailInputContainerViewConfiguration = InputContainerViewConfiguration(_containerHeight: 55, _icon:  #imageLiteral(resourceName: "ic_mail_outline_white_2x"), _iconTintColor: UIColor(red: 78/255, green: 80/255, blue: 88/255, alpha: 1), _iconAlpha: 0.88, _dividerBackgroundColor: .white)
    
    static let passwordInputContainerViewConfiguration =  InputContainerViewConfiguration(_containerHeight: 55, _icon:  #imageLiteral(resourceName: "ic_lock_outline_white_2x"), _iconTintColor: UIColor(red: 78/255, green: 80/255, blue: 88/255, alpha: 1), _iconAlpha: 0.88, _dividerBackgroundColor: .white)
    
    static let fullnameInputContainerViewConfiguration = InputContainerViewConfiguration(_containerHeight: 55, _icon:  #imageLiteral(resourceName: "ic_person_outline_white_2x"), _iconTintColor: UIColor(red: 78/255, green: 80/255, blue: 88/255, alpha: 1), _iconAlpha: 0.88, _dividerBackgroundColor: .white)
    
    static let usernameInputContainerViewConfiguration = InputContainerViewConfiguration(_containerHeight: 55, _icon:  #imageLiteral(resourceName: "ic_person_outline_white_2x"), _iconTintColor: UIColor(red: 78/255, green: 80/255, blue: 88/255, alpha: 1), _iconAlpha: 0.88, _dividerBackgroundColor: .white)
}

