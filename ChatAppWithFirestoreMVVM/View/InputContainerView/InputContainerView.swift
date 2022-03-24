//
//  InputContainerView.swift
//  ChatAppWithFirestoreMVVM
//
//  Created by alican on 18.03.2022.
//

import UIKit

class InputContainerView : UIView{
    
    private var textFormComponent: TextFormComponent?
    
    private lazy var imageView: CustomImageView = {
        let configuration = CustomImageViewConfiguration(_tintColor: UIColor(red: 78/255, green: 80/255, blue: 88/255, alpha: 1), _alpha: 0.88)
        let customImageView = CustomImageView(customTextFieldConfiguration: configuration)
        return customImageView
    }()
    
    private lazy var warningLabel: CustomLabel = {
        let configuration = CustomLabelConfiguration(_textColor: #colorLiteral(red: 0.1921568662, green: 0.007843137719, blue: 0.09019608051, alpha: 1), _fontSize: 9, _textAlignment: .center)
        let customLabel = CustomLabel(customTextFieldConfiguration: configuration)
        return customLabel
    }()
    
    private lazy var dividerView: UIView = {
        let dividerView = UIView()
        dividerView.backgroundColor = .white
        return dividerView
    }()
    
    private lazy var textField: CustomTextField = {
        let configuration = CustomTextFieldConfiguration(_fontSize: 14, _textColor: .white, _placeholderColor: .white, _keyboardAppearance: .dark, _keyboardType: .default, _borderStyle: .none)
        let customTextField = CustomTextField(customTextFieldConfiguration: configuration)
        customTextField.addTarget(self, action: #selector(textFieldChangesHandled), for: .editingChanged)
        return customTextField
    }()
        
    init(formComponent : FormComponent){
       super.init(frame: .zero)
       configureConsraints()
       configureFeatures(formComponent : formComponent)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented.")
    }
}

private extension InputContainerView{
    
    func configureConsraints(){
        setHeight(height: 55)
        
        addSubview(imageView)
        imageView.centerY(inView: self)
        imageView.anchor(left: leftAnchor, paddingLeft: 8)
        imageView.setDimensions(height: 20, width: 20)
        
        addSubview(warningLabel)
        warningLabel.anchor(left: leftAnchor,bottom: bottomAnchor,right: rightAnchor,paddingLeft: 8,paddingBottom: 0,paddingRight: 8,height: 11)
        
        addSubview(dividerView)
        dividerView.anchor(left: leftAnchor,bottom: warningLabel.topAnchor,right: rightAnchor,paddingLeft: 8,paddingBottom: 4,paddingRight: 8,height: 0.75)
        
        addSubview(textField)
        textField.centerY(inView: self)
        textField.anchor(left: imageView.rightAnchor , right: rightAnchor , paddingLeft: 8)
    }
    
    func configureFeatures(formComponent : FormComponent){
        guard let component = formComponent as? TextFormComponent else { return }
        textFormComponent = component
        imageView.image = UIImage(named: textFormComponent!.leftIconImage)
        let attributedPlaceholder = NSAttributedString(string: textFormComponent!.placeholderName,attributes: [NSAttributedString.Key.foregroundColor : textFormComponent!.placeHolderColor])
        textField.attributedPlaceholder = attributedPlaceholder
        textField.isSecureTextEntry = textFormComponent!.isSecureTextEntry
    }
    
    @objc func textFieldChangesHandled(){
        guard let text = textField.text else {return}
        ComponentBuilder.shared.update(val: text, componentSectionType: textFormComponent!.sectionType, componentType: textFormComponent!.componentType)
        do {
            for validator in textFormComponent!.validations{
                try validator.validate(text)
            }
            warningLabel.textColor = .systemGreen
            warningLabel.text = ""
        } catch {
            warningLabel.textColor = #colorLiteral(red: 0.1921568662, green: 0.007843137719, blue: 0.09019608051, alpha: 1)
            if let validationError = error as? ValidationError{
                switch validationError {
                case .custom(let message):
                    warningLabel.text = message
                }
            }
        }
    }
}

