//
//  JGProgressHUDExtension.swift
//  ChatAppWithFirestoreMVVM
//
//  Created by alican on 27.03.2022.
//

import UIKit
import JGProgressHUD

extension UIViewController {
    static let hud = JGProgressHUD(style: .dark)
    
    func showLoader(_ show: Bool, withText text: String? = "Loading") {
        view.endEditing(true)
        UIViewController.hud.textLabel.text = text
        
        if show {
            UIViewController.hud.show(in: view)
        } else {
            UIViewController.hud.dismiss()
        }
    }
    
    func showError(_ errorMessage: String) {
        let alert = UIAlertController(title: "Error", message: errorMessage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
