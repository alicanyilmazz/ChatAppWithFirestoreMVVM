//
//  LoginController.swift
//  ChatAppWithFirestoreMVVM
//
//  Created by alican on 16.03.2022.
//

import Foundation
import UIKit

class LoginController : UIViewController{
    
    // MARK: - Properties
    private let iconImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "mans")
        imageView.tintColor = UIColor(red: 38/255, green: 42/255, blue: 52/255, alpha: 1)
        return imageView
    }()
    
    private lazy var emailContainerView : InputContainerView = {
        return InputContainerView(formComponent: ComponentBuilder.shared.content[ComponentSectionType.loginSection.rawValue].components[ComponentSectionType.LoginComponentType.email.rawValue])
    }()
    
    private lazy var passwordContainerView : InputContainerView = {
        return InputContainerView(formComponent: ComponentBuilder.shared.content[ComponentSectionType.loginSection.rawValue].components[ComponentSectionType.LoginComponentType.password.rawValue])
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Sign In", for: .normal)
        button.layer.cornerRadius = 5
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.tintColor = .white
        button.backgroundColor = UIColor(red: 84/255, green: 104/255, blue: 255/255, alpha: 1)
        button.setHeight(height: 50)
        button.addTarget(self, action: #selector(handleAuthentication), for: .touchUpInside)
        return button
    }()
    
    private let dontHaveAccountButton: UIButton = {
        let button = UIButton(type: .system)
        let attributedTitle = NSMutableAttributedString(string: "Don't have an account?  ",attributes: [.font : UIFont.systemFont(ofSize: 13),.foregroundColor: UIColor.white])
        attributedTitle.append(NSAttributedString(string: "Sign Up",attributes: [.font: UIFont.boldSystemFont(ofSize: 13),.foregroundColor: UIColor.white]))
        button.setAttributedTitle(attributedTitle, for: .normal)
        button.addTarget(self, action: #selector(handleShowSignUp), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: Selectors
    @objc func handleShowSignUp(){
        let controller = RegistrationController()
        navigationController?.pushViewController(controller, animated: true)
    }
    
    @objc func handleAuthentication(){
        let result = ComponentBuilder.shared.validate(componentSectionType: ComponentSectionType.loginSection.rawValue)
        if result{
           print("Authenticated")
           let data = ComponentBuilder.shared.getData(componentSectionType: ComponentSectionType.loginSection.rawValue)
           let loginViewModel : LoginViewModel = LoginViewModel(email: data[0], password: data[1])
           // Send Request to API
        }else{
            print("Not Authenticated")
        }
    }
    
    // MARK: - Helpers
    
    func configureUI(){
        navigationController?.navigationBar.isHidden = true
        navigationController?.navigationBar.barStyle = .black
        
        configureGradientLayer()
        
        view.addSubview(iconImage)
        iconImage.centerX(inView: view)
        iconImage.anchor(top: view.safeAreaLayoutGuide.topAnchor,paddingTop: 32)
        iconImage.setDimensions(height: 200, width: 200)
        
        let stack = UIStackView(arrangedSubviews: [emailContainerView,passwordContainerView,loginButton])
        stack.axis = .vertical
        stack.spacing = 10
        view.addSubview(stack)
        stack.anchor(top: iconImage.bottomAnchor,left: view.leftAnchor,right: view.rightAnchor,paddingTop: 32,paddingLeft: 32,paddingRight: 32)
        
        view.addSubview(dontHaveAccountButton)
        dontHaveAccountButton.anchor(left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor,right: view.rightAnchor, paddingLeft: 32,paddingBottom: 32, paddingRight: 32)
    }
}
 
