//
//  FirstViewController.swift
//  WalkTogether
//
//  Created by Aleksei on 15.03.2023.
//

import UIKit

protocol FirstViewControllerProtocol: AnyObject {
}

final class FirstViewController: UIViewController {
    // MARK: - Private Properties
    
    private let presenter: FirstViewPresenter

    // MARK: - Init
    
    init(presenter: FirstViewPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
        view.backgroundColor = .red
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

    // MARK: - FirstViewController + FirstViewControllerProtocol

extension FirstViewController: FirstViewControllerProtocol {
}
