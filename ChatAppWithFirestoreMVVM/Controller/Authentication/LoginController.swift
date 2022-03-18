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
        imageView.image = UIImage(systemName: "bubble.right")
        imageView.tintColor = UIColor(red: 38/255, green: 42/255, blue: 52/255, alpha: 1)
        return imageView
    }()
    
    private lazy var emailContainerView : UIView = {
        let containerView = UIView()
        containerView.backgroundColor = UIColor(red: 38/255, green: 42/255, blue: 52/255, alpha: 1)
        containerView.setHeight(height: 50)
        
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "envelope")
        imageView.tintColor = UIColor(red: 78/255, green: 80/255, blue: 88/255, alpha: 1)
        containerView.addSubview(imageView)
        imageView.centerY(inView: containerView)
        imageView.anchor(left: containerView.leftAnchor,paddingLeft: 8)
        imageView.setDimensions(height: 22, width: 26)
        
        containerView.addSubview(emailTextField)
        emailTextField.centerY(inView: containerView)
        emailTextField.anchor(left: imageView.rightAnchor,right: containerView.rightAnchor,paddingLeft: 8, paddingRight: 8)
        
        return containerView
    }()
    
    private let emailTextField: UITextField = {
       let textField = UITextField()
       textField.attributedPlaceholder = NSAttributedString(string: "Email",attributes: [NSAttributedString.Key.foregroundColor : UIColor(red: 78/255, green: 80/255, blue: 88/255, alpha: 1)])
       textField.textColor = .white
       return textField
    }()
    
    private lazy var passwordContainerView : UIView = {
       let containerView = UIView()
        containerView.backgroundColor = UIColor(red: 38/255, green: 42/255, blue: 52/255, alpha: 1)
        containerView.setHeight(height: 50)
        
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "lock")
        imageView.tintColor = UIColor(red: 78/255, green: 80/255, blue: 88/255, alpha: 1)
        containerView.addSubview(imageView)
        imageView.centerY(inView: containerView)
        imageView.anchor(left: containerView.leftAnchor,paddingLeft: 8)
        imageView.setDimensions(height: 26, width: 26)
        
        containerView.addSubview(passwordTextField)
        passwordTextField.centerY(inView: containerView)
        passwordTextField.anchor(left: imageView.rightAnchor,right: containerView.rightAnchor,paddingLeft: 8, paddingRight: 8)
        
        return containerView
    }()
    
    private let passwordTextField: UITextField = {
       let textField = UITextField()
       textField.attributedPlaceholder = NSAttributedString(string: "Password",attributes: [NSAttributedString.Key.foregroundColor : UIColor(red: 78/255, green: 80/255, blue: 88/255, alpha: 1)])
       textField.textColor = .white
       textField.isSecureTextEntry = true
       return textField
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Log In", for: .normal)
        button.layer.cornerRadius = 5
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.tintColor = .white
        button.backgroundColor = UIColor(red: 84/255, green: 104/255, blue: 255/255, alpha: 1)
        button.setHeight(height: 50)
        return button
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: - Helpers
    
    func configureUI(){
        navigationController?.navigationBar.isHidden = true
        navigationController?.navigationBar.barStyle = .black
        
        //configureGradientLayer()
        view.backgroundColor = UIColor(red: 7/255, green: 8/255, blue: 10/255, alpha: 1)
        
        view.addSubview(iconImage)
        iconImage.centerX(inView: view)
        iconImage.anchor(top: view.safeAreaLayoutGuide.topAnchor,paddingTop: 32)
        iconImage.setDimensions(height: 120, width: 120)
        
        let stack = UIStackView(arrangedSubviews: [emailContainerView,passwordContainerView,loginButton])
        stack.axis = .vertical
        stack.spacing = 16
        view.addSubview(stack)
        stack.anchor(top: iconImage.bottomAnchor,left: view.leftAnchor,right: view.rightAnchor,paddingTop: 32,paddingLeft: 32,paddingRight: 32)
        
    }
    
    func configureGradientLayer(){
        let gradient = CAGradientLayer()
        gradient.colors = [RGBColors.darkBlue.cgColor,RGBColors.darkBlue.cgColor,RGBColors.y.cgColor]
        gradient.locations = [0,1]
        //view.layer.addSublayer(gradient)
        //gradient.frame = view.frame
    }
}
 
class RGBColors{
    static let darkBlue = #colorLiteral(red: 0.01960784314, green: 0.09803921569, blue: 0.2156862745, alpha: 1)
    static let midBlue = #colorLiteral(red: 0, green: 0.3019607843, blue: 0.4784313725, alpha: 1)
    static let lightBlue = #colorLiteral(red: 0, green: 0.5294117647, blue: 0.5764705882, alpha: 1)
    static let lightGreen = #colorLiteral(red: 0, green: 0.7490196078, blue: 0.4470588235, alpha: 1)
    static let yellowGreen = #colorLiteral(red: 0.6588235294, green: 0.9215686275, blue: 0.07058823529, alpha: 1)
    static let insideGray = #colorLiteral(red: 0.09411764706, green: 0.1019607843, blue: 0.1254901961, alpha: 1)
    static let y = #colorLiteral(red: 0.1215686275, green: 0.1607843137, blue: 0.2, alpha: 1)
    static let z = #colorLiteral(red: 0.1607843137, green: 0.1921568627, blue: 0.2352941176, alpha: 1)
}


