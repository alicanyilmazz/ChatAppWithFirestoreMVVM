//
//  RegistrationController.swift
//  ChatAppWithFirestoreMVVM
//
//  Created by alican on 16.03.2022.
//

import Foundation
import UIKit

class RegistrationController : UIViewController{
    
    // MARK: - Properties
    
    private let plusPhotoButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "plus_photo"), for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(handleSelectPhoto), for: .touchUpInside)
        return button
    }()
    
    private lazy var emailContainerView : UIView = {
        return InputContainerView(textField: emailTextField, inputContainerViewConfiguration: InputContainerViewConfiguration.emailInputContainerViewConfiguration)
    }()
    
    private let emailTextField: CustomTextField = CustomTextField(customTextFieldConfiguration: CustomTextFieldConfiguration.emailLoginTextField)
    
    private lazy var fullnameContainerView : UIView = {
        return InputContainerView(textField: fullnameTextField, inputContainerViewConfiguration: InputContainerViewConfiguration.fullnameInputContainerViewConfiguration)
    }()
    
    private let fullnameTextField: CustomTextField = CustomTextField(customTextFieldConfiguration: CustomTextFieldConfiguration.fullnameLoginTextField)
    
    private lazy var usernameContainerView : UIView = {
        return InputContainerView(textField: usernameTextField, inputContainerViewConfiguration: InputContainerViewConfiguration.usernameInputContainerViewConfiguration)
    }()
    
    private let usernameTextField: CustomTextField = CustomTextField(customTextFieldConfiguration: CustomTextFieldConfiguration.usernameLoginTextField)
    
    private lazy var passwordContainerView : UIView = {
        return InputContainerView(textField: passwordTextField, inputContainerViewConfiguration: InputContainerViewConfiguration.passwordInputContainerViewConfiguration)
    }()
    
    private let passwordTextField: CustomTextField = CustomTextField(customTextFieldConfiguration: CustomTextFieldConfiguration.passwordLoginTextField)
    
    private let registerButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Sign Up", for: .normal)
        button.layer.cornerRadius = 5
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.tintColor = .white
        button.backgroundColor = UIColor(red: 84/255, green: 104/255, blue: 255/255, alpha: 1)
        button.setHeight(height: 50)
        return button
    }()
    
    private let alreadyAccountButton: UIButton = {
        let button = UIButton(type: .system)
        let attributedTitle = NSMutableAttributedString(string: "Already have an account?  ",attributes: [.font : UIFont.systemFont(ofSize: 13),.foregroundColor: UIColor.white])
        attributedTitle.append(NSAttributedString(string: "Sign In",attributes: [.font: UIFont.boldSystemFont(ofSize: 13),.foregroundColor: UIColor.white]))
        button.setAttributedTitle(attributedTitle, for: .normal)
        button.addTarget(self, action: #selector(handleShowSignIn), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: - Selectors
    
    @objc func handleSelectPhoto(){
        print("selected")
    }
    
    @objc func handleShowSignIn(){
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Helpers
    
    func configureUI(){
        configureGradientLayer()
        
        view.addSubview(plusPhotoButton)
        plusPhotoButton.centerX(inView: view)
        plusPhotoButton.anchor(top: view.safeAreaLayoutGuide.topAnchor,paddingTop: 32)
        plusPhotoButton.setDimensions(height: 120, width: 120)
        
        let stack = UIStackView(arrangedSubviews: [emailContainerView,fullnameContainerView,usernameContainerView,passwordContainerView,registerButton])
        stack.axis = .vertical
        stack.spacing = 16
        view.addSubview(stack)
        stack.anchor(top: plusPhotoButton.bottomAnchor,left: view.leftAnchor,right: view.rightAnchor,paddingTop: 32,paddingLeft: 32,paddingRight: 32)
        
        view.addSubview(alreadyAccountButton)
        alreadyAccountButton.anchor(left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor,right: view.rightAnchor, paddingLeft: 32,paddingBottom: 32, paddingRight: 32)
    }
}
