//
//  UIAlertController+EX.swift
//  WalkTogether
//
//  Created by Aleksei on 08.04.2023.
//

import UIKit

extension UIAlertController {
    func addActions(_ actions: [UIAlertAction]?) {
        if actions == nil {
            addAction(
                UIAlertAction(
                    title: LocalConstants.alertOkActionTitle,
                    style: .cancel)
            )
        } else {
            actions?.forEach { action in
                addAction(action)
            }
        }
    }

    // MARK: - Local Constants

    private enum LocalConstants {
        static let alertOkActionTitle: String = "Ok"
    }
}
