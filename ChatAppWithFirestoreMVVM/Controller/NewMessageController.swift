//
//  NewMessageController.swift
//  ChatAppWithFirestoreMVVM
//
//  Created by alican on 27.03.2022.
//

import UIKit

private let reuseIdentifier = "UserCell"

class NewMessageController: UITableViewController{
    // MARK: - Properties
    
    private var users = [User]()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        fetchUsers()
    }
    
    // MARK: - Selector
    
    @objc func handleDismissal(){
        dismiss(animated: true,completion: nil)
    }
    
    // MARK: - API
    
    func fetchUsers(){
        Service.fetchUsers { users in
            self.users = users
            self.tableView.reloadData()
        }
    }
    
    // MARK: - Helpers
    
    func configureUI(){
       configureNavigationBar(withTitle: "New Message", prefersLargeTitles: false)
       configureBarButtonItem()
       configureTableView()
    }
    
    fileprivate func configureBarButtonItem() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(handleDismissal))
    }
    
    fileprivate func configureTableView(){
        tableView.tableFooterView = UIView()
        tableView.register(UserCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableView.rowHeight = 80
        
    }
}

// MARK: - UITableViewDataSource
extension NewMessageController{
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier,for: indexPath) as! UserCell
        cell.user = users[indexPath.row]
        return cell
    }
}
