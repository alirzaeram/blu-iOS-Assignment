//
//  SceneDelegate.swift
//  blu iOS Assignment
//
//  Created by Philip Eram on 4/17/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        self.window = window
        
        
        let mainNavigation: UINavigationController = .init()
        let router: Router = .init(navigationController: mainNavigation)
        window.rootViewController = mainNavigation
        
        router.navigateToHome()
        
        window.makeKeyAndVisible()
    }
}

