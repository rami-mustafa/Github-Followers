//
//  GFRepoItemVC.swift
//  GithubFollowers
//
//  Created by Rami Mustafa on 25.07.24.
//

import UIKit
 

class GFRepoItemVC: GFItemInfoVC {
    
 
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
        itemInfoViewOne.set(itemInfoType: .repos, withCount: user.publicRepos)
        itemInfoViewTwo.set(itemInfoType: .gists, withCount: user.publicGists)
        actionButton.set(color: .systemPurple, title: "Github Profile", systemImageName: "person")
    }
    
    
}
