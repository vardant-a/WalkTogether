//
//  Coordinator.swift
//  WalkTogether
//
//  Created by Aleksei on 08.04.2023.
//

import UIKit

final class Coordinator {
    // MARK: - Private Properties
    
    private let window: UIWindow?
    private let moduleFactory: ModuleFactory

    private var currentTransitionHandler: TransitionHandler?
    
    // MARK: - Init
    
    init(window: UIWindow?, moduleFactory: ModuleFactory) {
        self.window = window
        self.moduleFactory = moduleFactory
    }
    
    // MARK: - Public Methods
    
    func start() {
        let controller = moduleFactory.buildFirstViewController()
        currentTransitionHandler = controller
        window?.rootViewController = controller
        window?.makeKeyAndVisible()
    }
}

protocol TransitionHandler: AnyObject {
    func present(
        viewController: UIViewController,
        animated: Bool
    )
    func dismiss()
}

extension UIViewController: TransitionHandler {
    func present(
        viewController: UIViewController,
        animated: Bool
    ) {
        present(
            viewController,
            animated: animated)
    }

    func dismiss() {
        dismiss(animated: true)
    }
}
