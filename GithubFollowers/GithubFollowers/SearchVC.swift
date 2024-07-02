//
//  SearchVC.swift
//  GithubFollowers
//
//  Created by Rami Mustafa on 30.06.24.
//

import UIKit
import SnapKit

class SearchVC: UIViewController {
    
    // MARK: - UI Components
    let logoImageView = UIImageView()
    let usernameTextField = GFTextField()
    
    
    // MARK: - Variables
    
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        usernameTextField.text = ""
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    
    
    
    
    // MARK: - UI Setup
    private func setupView(){
        view.addSubview(logoImageView)
        logoImageView.image = UIImage(named: "gh-logo")
        let topConstraintConstant: CGFloat = DeviceTypes.isiPhoneSE || DeviceTypes.isiPhone8Zoomed ? 20 : 80
        logoImageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(topConstraintConstant)
            make.centerX.equalToSuperview()
            make.height.width.equalTo(200)
        }
        
        view.addSubview(usernameTextField)
         usernameTextField.snp.makeConstraints { make in
            make.top.equalTo(logoImageView.snp.bottom).offset(48)
            make.leading.equalToSuperview().offset(50)
            make.trailing.equalToSuperview().offset(-50)
            make.height.equalTo(50)
        }
        
    }
    
    // MARK: - Selectors
    
}

