//
//  UIViewController+CurrentTransitionHandler.swift
//  WalkTogether
//
//  Created by Aleksei on 08.04.2023.
//

import UIKit

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
