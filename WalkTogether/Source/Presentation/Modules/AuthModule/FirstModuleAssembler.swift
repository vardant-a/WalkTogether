//
//  FirstModuleAssembler.swift
//  WalkTogether
//
//  Created by Aleksei on 08.04.2023.
//

import UIKit

struct FirstModuleAssembler {
    // MARK: - Public Methods
    
    static func build(coordinator: Coordinator) -> UIViewController {
        let presenter = FirstViewPresenter(coordinator: coordinator)
        let viewController = FirstViewController(presenter: presenter)
        presenter.injectView(with: viewController)
        return viewController
    }
    
    // MARK: - Private Init
    
    private init() {}
}
