//
//  UIView.swift
//  GithubFollowers
//
//  Created by Rami Mustafa on 08.07.24.
//

import UIKit

extension UIView{
    func addSubviews(_ views: UIView...){
        for view in views {
            addSubview(view)
        }
    }
}
