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
        guard let scene = (scene as? UIWindowScene) else { return }
        let  window = UIWindow(windowScene: scene)
        
        window.rootViewController = ViewController()
        self.window = window
        self.window?.makeKeyAndVisible()
    }

   
}

