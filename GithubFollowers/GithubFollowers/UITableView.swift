//
//  UITableView.swift
//  GithubFollowers
//
//  Created by Rami Mustafa on 08.07.24.
//

 

import UIKit

extension UITableView{
    func removeExcessCells(){
        tableFooterView = UIView(frame: .zero)
    }
    
    func reloadDataOnMainThread(){
        DispatchQueue.main.async {
            self.reloadData()
        }
    }
}
