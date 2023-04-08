//
//  ModuleFactory.swift
//  WalkTogether
//
//  Created by Aleksei on 08.04.2023.
//

import UIKit

final class ModuleFactory {
    // MARK: - Private Properties
    
    private weak var coordinator: Coordinator?
    private let featuresFactory: FeaturesFactory
    
    // MARK: - Init
    
    init(featuresFactory: FeaturesFactory) {
        self.featuresFactory = featuresFactory
    }
    
    // MARK: - Public Methods
    
    func injectCoordinator(with coordinator: Coordinator) {
        if self.coordinator == nil { self.coordinator = coordinator}
    }
    
    func buildFirstViewController() -> UIViewController {
        return ViewController()
    }
}
