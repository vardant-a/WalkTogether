//
//  FirstViewPresenter.swift
//  WalkTogether
//
//  Created by Aleksei on 08.04.2023.
//

import UIKit

final class FirstViewPresenter {
    // MARK: Private Properties
    
    private let coordinator: Coordinator
    private weak var view: FirstViewControllerProtocol?
    
    // MARK: - Init
    
    init(coordinator: Coordinator) {
        self.coordinator = coordinator
    }
    
    // MARK: - Public Methods
    
    func injectView(with view: FirstViewControllerProtocol?) {
        if self.view == nil { self.view = view }
    }
}
