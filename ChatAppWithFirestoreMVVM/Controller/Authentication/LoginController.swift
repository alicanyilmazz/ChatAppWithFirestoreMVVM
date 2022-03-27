//
//  LoginController.swift
//  ChatAppWithFirestoreMVVM
//
//  Created by alican on 16.03.2022.
//

import UIKit
import Firebase
import JGProgressHUD

class LoginController : UIViewController{
    
    // MARK: - Properties
    
    private var viewModel : LoginViewModel = LoginViewModel()
    
    private lazy var iconImage: BasicImageView = {
       let configuration = BasicImageViewConfiguration(imageName: "mans", tintColor: UIColor(red: 38/255, green: 42/255, blue: 52/255, alpha: 1))
       return BasicImageView(imageViewConfiguration: configuration)
    }()
    
    private lazy var emailContainerView : InputContainerView = {
        return InputContainerView(formComponent: ComponentBuilder.shared.content[ComponentSectionType.loginSection.rawValue].components[ComponentSectionType.LoginComponentType.email.rawValue])
    }()
    
    private lazy var passwordContainerView : InputContainerView = {
        return InputContainerView(formComponent: ComponentBuilder.shared.content[ComponentSectionType.loginSection.rawValue].components[ComponentSectionType.LoginComponentType.password.rawValue])
    }()
    
    private let loginButton : CustomStandartButton = {
       let configuration = CustomStandartButtonConfiguration(title: "Sign In")
       let button = CustomStandartButton(standartButtonConfiguration: configuration)
       button.addTarget(self, action: #selector(handleAuthentication), for: .touchUpInside)
       return button
    }()
    
    private let dontHaveAccountButton: CustomTextButton = {
       let configuration = CustomTextButtonConfiguration(firstTitle: "Don't have an account? ", secondTitle: "Sign Up")
       let button = CustomTextButton(textButtonConfiguration: configuration)
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
           showLoader(true,withText: "Logging in")
           let data = ComponentBuilder.shared.getData(componentSectionType: ComponentSectionType.loginSection.rawValue)
           viewModel.email = data[0]
           viewModel.password = data[1]
            
           AuthService.shared.logUserIn(withEmail: viewModel.email!, password: viewModel.password!) { result, error in
                if let error = error{
                    print("DEBUG: Failed to log in with error \(error)")
                    self.showLoader(false)
                    return
                }
                
               self.showLoader(false)
               self.dismiss(animated: true,completion: nil)
            }
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
 
