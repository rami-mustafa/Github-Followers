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
    
    // MARK: - UI Components
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViewController()
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
             } catch{
                if let gfError = error as? GFError{
                    presentGFAlert(title: "Something Went Wrong", message: gfError.rawValue, buttonTitle: "Ok")
                } else{
                 }
            }
        }
    }
    
    
    // MARK: - Selectors
    
    @objc func dismissVC(){
        dismiss(animated: true)
    }

}
