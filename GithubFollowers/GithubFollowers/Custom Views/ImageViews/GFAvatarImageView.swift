//
//  GFAvatarImageView.swift
//  GithubFollowers
//
//  Created by Rami Mustafa on 22.07.24.
//

 
import UIKit

class GFAvatarImageView: UIImageView {
    
    let cache = NetworkManager.shared.cache
    let placeholderImage = UIImage(named: "aavatar-placeholder")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI(){
        layer.cornerRadius = 10
        clipsToBounds = true
        image = placeholderImage
    }
    
    func downloadImage(fromURL url: String){
        Task{
            image = await NetworkManager.shared.downloadImage(from: url) ?? placeholderImage
        }
    }
}
