//
//  ConversationsController.swift
//  ChatAppWithFirestoreMVVM
//
//  Created by alican on 16.03.2022.
//

import UIKit
import Firebase

private let reuseIdentifier = "ConversationCell"

class ConversationsController : UIViewController{
    // MARK: - Properties
    
    private let tableView = UITableView()
    
    private let newMessageButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.backgroundColor = .systemPurple
        button.tintColor = .white
        button.imageView?.setDimensions(height: 24, width: 24)
        button.addTarget(self, action: #selector(showNewMessage), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        authenticateUser()
    }
    
    // MARK: - Selectors
    @objc func showProfile(){
        logOut()
    }
    
    @objc func showNewMessage(){
        let controller = NewMessageController()
        let nav = UINavigationController(rootViewController: controller)
        nav.modalPresentationStyle = .fullScreen
        present(nav,animated: true,completion: nil)
    }
    
    // MARK: - API
    func authenticateUser(){
        if Auth.auth().currentUser?.uid == nil{
            presentLoginScreen()
        }else{
            print("DEBUG: User id is \(Auth.auth().currentUser?.uid)")
        }
    }
    
    func logOut(){
        do {
            try Auth.auth().signOut()
            presentLoginScreen()
        } catch  {
            print("DEBUG: Error signing out..")
        }
    }
    
    
    // MARK: - Helpers
 
    func configureUI(){
        view.backgroundColor = .white
        configureNavigationBar(withTitle: "Messages", prefersLargeTitles: true)
        configureBarButtonItem()
        configureTableView()
        configureFloatingButton()
    }
    
    func configureTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .white
        tableView.rowHeight = 80
        //tableView.separatorStyle = .singleLine
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableView.tableFooterView = UIView()
        view.addSubview(tableView)
        tableView.frame = view.frame
    }
        
    fileprivate func configureBarButtonItem() {
        let image = UIImage(systemName: "person.circle.fill")
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(showProfile))
    }
    
    fileprivate func configureFloatingButton() {
        view.addSubview(newMessageButton)
        newMessageButton.setDimensions(height: 56, width: 56)
        newMessageButton.layer.cornerRadius = 56 / 2
        newMessageButton.anchor(bottom: view.bottomAnchor,right: view.rightAnchor,paddingBottom: 24,paddingRight: 24)
    }
    
    func presentLoginScreen(){
        DispatchQueue.main.async {
            let controller = LoginController()
            let nav = UINavigationController(rootViewController: controller)
            nav.modalPresentationStyle = .fullScreen
            self.present(nav, animated: true,completion: nil)
        }
    }
}


// MARK: - UITableViewDataSource

extension ConversationsController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier,for: indexPath)
        cell.textLabel?.text = "Test Cell"
        return cell
    }
}

// MARK: - UITableViewDelegate

extension ConversationsController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        print(indexPath.row)
    }
}
