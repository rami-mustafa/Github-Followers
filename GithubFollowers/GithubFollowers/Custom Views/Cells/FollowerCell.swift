//
//  FollowerCell.swift
//  GithubFollowers
//
//  Created by Rami Mustafa on 22.07.24.
//

import UIKit

class FollowerCell: UICollectionViewCell {
    
    static let reuseID: String = "FollowerCell"
    
    let avatarImageView = UIImageView()
     let usernameLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func set(follower: Follower){
        usernameLabel.text = follower.login
    }
    
    
    private func configure(){
        
        addSubviews(avatarImageView)
        addSubviews(usernameLabel)
        
        
        usernameLabel.textColor = .red
        
        let padding: CGFloat = 8
        
        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: topAnchor, constant: padding ),
            avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding ),
            avatarImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding ),
            avatarImageView.heightAnchor.constraint(equalToConstant: 20 ),

            usernameLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor , constant: 12 ),
            usernameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding ),
            usernameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding ),
            usernameLabel.heightAnchor.constraint(equalToConstant: 20 )
        ])
    }
}
