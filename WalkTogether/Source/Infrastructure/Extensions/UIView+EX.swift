//
//  UIView+EX.swift
//  WalkTogether
//
//  Created by Aleksei on 24.04.2023.
//

import UIKit

extension UIView {
    func addSubviewAndConstrains(_ subview: UIView, handler: (() -> Void)?) {
        addSubview(subview)
        subview.translatesAutoresizingMaskIntoConstraints = false
        handler?()
    }
    
    func addSubviews(_ subviews: UIView...) {
        subviews.forEach {
            addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    func removeSubviews() {
        subviews.forEach {
            $0.removeSubviews()
        }
    }
}
