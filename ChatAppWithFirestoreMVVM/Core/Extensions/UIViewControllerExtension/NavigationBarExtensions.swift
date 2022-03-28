//
//  NavigationBarExtensions.swift
//  ChatAppWithFirestoreMVVM
//
//  Created by alican on 27.03.2022.
//

import UIKit

extension UIViewController{
    
    func configureNavigationBar(withTitle title: String, prefersLargeTitles: Bool , foregroundColor : UIColor = .white , backgroundColor: UIColor = .systemPurple) {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.largeTitleTextAttributes = [.foregroundColor: foregroundColor]
        appearance.backgroundColor = backgroundColor
        
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
        navigationController?.navigationBar.prefersLargeTitles = prefersLargeTitles
        navigationItem.title = title
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.isTranslucent = true
        
        navigationController?.navigationBar.overrideUserInterfaceStyle = .dark
    }
}
