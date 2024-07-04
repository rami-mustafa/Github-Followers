//
//  SceneDelegate.swift
//  GithubFollowers
//
//  Created by Rami Mustafa on 27.06.24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let  window = UIWindow(windowScene: windowScene)
        window.rootViewController = ccreateTabBar()
        self.window = window
        self.window?.makeKeyAndVisible()

    }

    func createSearchNC() -> UINavigationController {
        let searchVC = SearchVC()
        searchVC.title = "Search"
        searchVC.tabBarItem = UITabBarItem(tabBarSystemItem: .search ,  tag: 0)
        return UINavigationController(rootViewController: searchVC)
    }
    
    func createFavoritesNC() -> UINavigationController {
        let FavoritesListVC = FavoritesListVC()
        FavoritesListVC.title = "Favorite"
        FavoritesListVC.tabBarItem = UITabBarItem(tabBarSystemItem: .history ,  tag: 1)
        return UINavigationController(rootViewController: FavoritesListVC)
    }
    
    
    func ccreateTabBar() -> UITabBarController {
        let tabbar = UITabBarController()
        UITabBar.appearance().tintColor = .systemGreen
        UITabBar.appearance().backgroundColor = .systemGray
        tabbar.viewControllers = [createSearchNC() , createFavoritesNC()]
     
        return tabbar
    }
}

