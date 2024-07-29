//
//  UserInfoVC.swift
//  GithubFollowers
//
//  Created by Rami Mustafa on 15.07.24.
//

import UIKit

class UserInfoVC: UIViewController {

    // MARK: - Variables
     var username: String!
     var itemViews: [UIView] = []

    
    // MARK: - UI Components
    let headerView  = UIView()
    let itemViewOne = UIView()
    let itemViewTwo = UIView()

    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViewController()
        layoutUI()
        getUserInfo()
    }
    
    // MARK: - UI Setup
    func configureViewController(){
          view.backgroundColor = .systemBackground
          let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissVC))
          navigationItem.rightBarButtonItem = doneButton
      }
    
    // MARK: - Get User Info
    func getUserInfo(){
        Task{
            do{
                let user = try await NetworkManager.shared.getUserInfo(for: username)
                DispatchQueue.main.async {
                    self.add(childVC: GFUserInfoHeaderVC(user: user), to: self.headerView)
                    self.add(childVC: GFRepoItemVC(user: user), to: self.itemViewTwo)
                    self.add(childVC: GFFollowerItemVC(user: user), to: self.itemViewOne)

                }
             } catch{
                if let gfError = error as? GFError{
                    presentGFAlert(title: "Something Went Wrong", message: gfError.rawValue, buttonTitle: "Ok")
                } else{
                 }
            }
        }
    }
    
    func layoutUI() {
//        view.addSubview(headerView)
//        headerView.translatesAutoresizingMaskIntoConstraints = false
//        
//        NSLayoutConstraint.activate([
//            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
//            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            headerView.heightAnchor.constraint(equalToConstant: 180)
//        ])
        
        
        let padding: CGFloat    = 20
        let itemHeight: CGFloat = 140
        
        itemViews = [headerView, itemViewOne, itemViewTwo]
        
        for itemView in itemViews {
            view.addSubview(itemView)
            itemView.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                itemView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
                itemView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding)
            ])
        }
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 180),
            
            itemViewOne.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: padding),
            itemViewOne.heightAnchor.constraint(equalToConstant: itemHeight),
            
            itemViewTwo.topAnchor.constraint(equalTo: itemViewOne.bottomAnchor, constant: padding),
            itemViewTwo.heightAnchor.constraint(equalToConstant: itemHeight)
        ])
    }
    
    func add(childVC: UIViewController, to containerView: UIView) {
        addChild(childVC)
        containerView.addSubview(childVC.view)
        childVC.view.frame = containerView.bounds
        childVC.didMove(toParent: self)
    }
    
    // MARK: - Selectors
    @objc func dismissVC(){
        dismiss(animated: true)
    }

}
