//
//  RegistrationController.swift
//  ChatAppWithFirestoreMVVM
//
//  Created by alican on 16.03.2022.
//

import Foundation
import UIKit
import Firebase

class RegistrationController : UIViewController{
    
    // MARK: - Properties
    
    private var viewModel : RegisterViewModel = RegisterViewModel()
    private var profileImage : UIImage?
        
    private let plusPhotoButton: CustomIconButton = {
        let configuration = CustomIconButtonConfiguration(image: #imageLiteral(resourceName: "plus_photo"))
        let button = CustomIconButton(iconButtonConfiguration: configuration)
        button.addTarget(self, action: #selector(handleSelectPhoto), for: .touchUpInside)
        button.clipsToBounds = true
        button.imageView?.contentMode = .scaleAspectFill
        return button
    }()
    
    private lazy var emailContainerView : InputContainerView = {
        return InputContainerView(formComponent:
            ComponentBuilder.shared.content[ComponentSectionType.registerSection.rawValue].components[ComponentSectionType.RegisterComponentType.email.rawValue])
    }()
    
    private lazy var fullnameContainerView : InputContainerView = {
        return InputContainerView(formComponent: ComponentBuilder.shared.content[ComponentSectionType.registerSection.rawValue].components[ComponentSectionType.RegisterComponentType.fullname.rawValue])
    }()
    
    private lazy var usernameContainerView : InputContainerView = {
        return InputContainerView(formComponent: ComponentBuilder.shared.content[ComponentSectionType.registerSection.rawValue].components[ComponentSectionType.RegisterComponentType.username.rawValue])
    }()
    
    private lazy var passwordContainerView : InputContainerView = {
        return InputContainerView(formComponent: ComponentBuilder.shared.content[ComponentSectionType.registerSection.rawValue].components[ComponentSectionType.RegisterComponentType.password.rawValue])
    }()
    
    private let registerButton : CustomStandartButton = {
       let configuration = CustomStandartButtonConfiguration(title: "Sign Up")
       let button = CustomStandartButton(standartButtonConfiguration: configuration)
        button.addTarget(self, action: #selector(handleAuthentication), for: .touchUpInside)
       return button
    }()
    
    private let alreadyAccountButton: CustomTextButton = {
       let configuration = CustomTextButtonConfiguration(firstTitle: "Already have an account? ", secondTitle: "Sign In")
       let button = CustomTextButton(textButtonConfiguration: configuration)
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
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        present(imagePickerController,animated: true,completion: nil)
    }
    
    @objc func handleAuthentication(){
        let result = ComponentBuilder.shared.validate(componentSectionType: ComponentSectionType.registerSection.rawValue)
        if result{
           let data = ComponentBuilder.shared.getData(componentSectionType: ComponentSectionType.registerSection.rawValue)
            viewModel.email = data[0]
            viewModel.password = data[1]
            viewModel.fullName = data[2]
            viewModel.username = data[3]
           //let registerViewModel : RegisterViewModel = RegisterViewModel(email: data[0], password: data[1],fullName: data[2],username: data[3])
           // Send Request to API
            guard let imageData = profileImage?.jpegData(compressionQuality: 0.4) else { return }
            let filename = NSUUID().uuidString
            let ref = Storage.storage().reference(withPath: "/profile_images/\(filename)")
            ref.putData(imageData, metadata: nil) { meta, error in
                if let error = error{
                    print("DEBUG : Failed to upload image with error \(error.localizedDescription)")
                    return
                }
                ref.downloadURL { url, error in
                    guard let profileImageUrl = url?.absoluteString else { return }
                    
                    Auth.auth().createUser(withEmail: self.viewModel.email!, password: self.viewModel.password!) { result, error in
                        if let error = error{
                            print("DEBUG : Failed to create user with error \(error.localizedDescription)")
                            return
                        }
                        guard let uid = result?.user.uid else { return }
                        let data = ["email": self.viewModel.email,"fullname": self.viewModel.fullName,"profileImageUrl": profileImageUrl,"uid":uid,"username": self.viewModel.username] as [String : Any]
                        
                        Firestore.firestore().collection("users").document(uid).setData(data){ error in
                            if let error = error{
                                print("DEBUG : Failed to creating user with error \(error.localizedDescription)")
                                return
                            }
                            print("DEBUG: User created...")
                        }
                    }
                }
            }
            
        }else{
            print("Not Authenticated")
        }
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

// MARK: - UIImagePickerControllerDelegate

extension RegistrationController : UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.originalImage] as? UIImage
        profileImage = image
        plusPhotoButton.setImage(image?.withRenderingMode(.alwaysOriginal), for: .normal)
        plusPhotoButton.layer.borderColor = UIColor(white: 1, alpha: 0.7).cgColor
        plusPhotoButton.layer.borderWidth = 2.0
        plusPhotoButton.layer.cornerRadius = 60
        
        dismiss(animated: true,completion: nil)
    }
}
