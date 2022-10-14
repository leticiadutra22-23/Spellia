//
//  SceneDelegate.swift
//  Spellia
//
//  Created by Maria Letícia Dutra de Oliveira on 11/10/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    func scene(
        _ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions:
        UIScene.ConnectionOptions) {
    guard let windowScene = (scene as? UIWindowScene) else { return }
    window = UIWindow(windowScene: windowScene)
    let viewController = SpellSearchController()
    window?.rootViewController = UINavigationController(rootViewController: viewController)
    window?.makeKeyAndVisible()

    }

    func sceneDidDisconnect(_ scene: UIScene) {

    }

    func sceneDidBecomeActive(_ scene: UIScene) {

    }

    func sceneWillResignActive(_ scene: UIScene) {

    }

    func sceneWillEnterForeground(_ scene: UIScene) {

    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
    }
}
