//
//  SceneDelegate.swift
//  globoplay-challenge
//
//  Created by Lucas Angeli Lima on 05/11/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).

        	guard let windowScene = (scene as? UIWindowScene) else { return }
        	let navigationController = UINavigationController()
        	let coordinator = TabCoordinator(navigation: navigationController)
        	
        	window = UIWindow(windowScene: windowScene)
            window?.rootViewController = coordinator.navigationController
        	window?.makeKeyAndVisible()
        	
        	coordinator.start()
        						
    }
}

