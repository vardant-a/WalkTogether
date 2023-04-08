//
//  SceneDelegate.swift
//  WalkTogether
//
//  Created by Aleksei on 15.03.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    // MARK: - Public Properties
    
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = scene as? UIWindowScene else { return }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        guard let window = window else { return }
        
        AppAssembler.start(window: window)
    }
}
