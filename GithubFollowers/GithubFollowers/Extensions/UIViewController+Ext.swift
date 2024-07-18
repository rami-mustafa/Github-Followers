//
//  UIViewController+Ext.swift
//  GithubFollowers
//
//  Created by Rami Mustafa on 18.07.24.
//

 
import UIKit
 
 

extension UIViewController{
    
    func presentGFAlert(title: String, message: String, buttonTitle: String, yesButtonAction: (() -> Void)? = nil) {
            let alertVC = GFAlertVC(alertTitle: title, message: message, buttonTitle: buttonTitle, yesButtonAction: yesButtonAction)
            alertVC.modalPresentationStyle = .overFullScreen
            alertVC.modalTransitionStyle = .crossDissolve
            present(alertVC, animated: true)
        }
}
