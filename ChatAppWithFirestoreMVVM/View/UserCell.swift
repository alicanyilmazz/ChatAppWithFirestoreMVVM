//
//  UserCell.swift
//  ChatAppWithFirestoreMVVM
//
//  Created by alican on 27.03.2022.
//

import UIKit
import SDWebImage

class UserCell: UITableViewCell{
    
    // MARK: - Properties
    
    var user: User?{
        didSet{configure()}
    }
    
    private let profileImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .systemPurple
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let usernameLabel: UILabel = {
       let label = UILabel()
       label.font = UIFont.boldSystemFont(ofSize: 12)
       label.text = "Spiderman"
       return label
    }()
    
    private let fullnameLabel: UILabel = {
       let label = UILabel()
       label.font = UIFont.systemFont(ofSize: 12)
       label.textColor = .lightGray
       label.text = "Peter Parker"
       return label
    }()
    
    // MARK: - Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(profileImageView)
        profileImageView.centerY(inView: self , leftAnchor: leftAnchor , paddingLeft: 12)
        profileImageView.setDimensions(height: 56, width: 56)
        profileImageView.layer.cornerRadius = 28
        
        let stackView = UIStackView(arrangedSubviews: [usernameLabel,fullnameLabel])
        stackView.axis = .vertical
        stackView.spacing = 2
        addSubview(stackView)
        stackView.centerY(inView: profileImageView,leftAnchor: profileImageView.rightAnchor,paddingLeft: 12)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Helpers
    
    func configure(){
        guard let user = user else { return }
        fullnameLabel.text = user.fullname
        usernameLabel.text = user.username
        
        guard let url = URL(string: user.profileImageUrl) else { return }
        profileImageView.sd_setImage(with: url)
    }
}
