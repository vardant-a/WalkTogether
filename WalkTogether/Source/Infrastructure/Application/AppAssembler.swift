//
//  AppAssembler.swift
//  WalkTogether
//
//  Created by Aleksei on 08.04.2023.
//

import UIKit

enum AppAssembler {
    static func start(window: UIWindow) {
        let servicesFactory = ServicesFactory()
        let featuresFactory = FeaturesFactory(servicesFactory: servicesFactory)
        let moduleFactory = ModuleFactory(featuresFactory: featuresFactory)
        let coordinator = Coordinator(
            window: window,
            moduleFactory: moduleFactory)
        moduleFactory.injectCoordinator(with: coordinator)
        coordinator.start()
    }
}
