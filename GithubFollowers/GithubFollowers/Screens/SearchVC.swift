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
    let callToActionButton = GFButton(color: .systemGreen, title: "Get Followers", systemImageName: "person.3")
    
    // MARK: - Variables
    var isUsernameEntered: Bool { return !usernameTextField.text!.isEmpty }
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        createDismissKeyboardTapGesture()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        usernameTextField.text = ""
        navigationController?.setNavigationBarHidden(true, animated: true)
    }

    
    // MARK: - UI Setup
    private func setupView(){
        view.backgroundColor = .white

        view.addSubview(logoImageView)
        logoImageView.image = UIImage(named: "gh-logo")
        let topConstraintConstant: CGFloat = DeviceTypes.isiPhoneSE || DeviceTypes.isiPhone8Zoomed ? 20 : 80
        logoImageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(topConstraintConstant)
            make.centerX.equalToSuperview()
            make.height.width.equalTo(200)
        }
        
        view.addSubview(usernameTextField)
        usernameTextField.delegate = self
        usernameTextField.snp.makeConstraints { make in
            make.top.equalTo(logoImageView.snp.bottom).offset(48)
            make.leading.equalToSuperview().offset(50)
            make.trailing.equalToSuperview().offset(-50)
            make.height.equalTo(50)
        }
        
        view.addSubview(callToActionButton)
        callToActionButton.addTarget(self, action: #selector(pushFollowerListVC), for: .touchUpInside)
        callToActionButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(120)
            make.leading.equalToSuperview().offset(50)
            make.trailing.equalToSuperview().inset(50)
            make.height.equalTo(50)
        }
    }
    
    func createDismissKeyboardTapGesture(){
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }
    
    // MARK: - Selectors
    @objc func pushFollowerListVC(){

        guard isUsernameEntered else {
            print("No Username")
            return
        }
        
        let followerListVC      = FollowerListVC()
        followerListVC.username = usernameTextField.text
        followerListVC.title    = usernameTextField.text
        
        navigationController?.pushViewController(followerListVC, animated: true)

        
    }
}


extension SearchVC: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print( "Arama Yapıldı " )
        pushFollowerListVC()
        return true
    }
}
