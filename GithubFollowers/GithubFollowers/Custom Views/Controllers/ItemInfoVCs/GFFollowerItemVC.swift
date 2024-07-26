//
//  GFFollowerItemVC.swift
//  GithubFollowers
//
//  Created by Rami Mustafa on 25.07.24.
//

import UIKit

 

class GFFollowerItemVC: GFItemInfoVC {
    
 
    init(user: User){
        super.init(user: user)
     }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
    }
    
    private func configureItems(){
        itemInfoViewOne.set(itemInfoType: .followers, withCount: user.followers)
        itemInfoViewTwo.set(itemInfoType: .following, withCount: user.following)
        actionButton.set(color: .systemGreen, title: "Get Followers", systemImageName: "person.3")
    }
    
     
}
