//
//  AppCoordinator.swift
//  COVStats
//
//  Created by Igor Podolskiy on 01.10.2020.
//  Copyright © 2020 Igor Podolskiy. All rights reserved.
//

import UIKit

class AppCoordinator {

    private let window: UIWindow
    private let tabBarController = UITabBarController()
    private let navigationControllers = UINavigationController()
    private let homeConfigurator: HomeConfiguratorProtocol = HomeConfigurator()

    init(window: UIWindow) {
        self.window = window
    }

    func start() {
        navigationControllers.setViewControllers([homeConfigurator.assemblyModule()], animated: false)
        tabBarController.setViewControllers([navigationControllers], animated: false)
        navigationControllers.tabBarItem = UITabBarItem(title: "Home", image: UIImage(named: "homeTab"), selectedImage: UIImage(named: "homeTabSelected"))
        window.rootViewController = tabBarController // associate VC as root VC
        window.makeKeyAndVisible()
    }
}

extension AppCoordinator {
}

fileprivate enum NavControllerType: Int, CaseIterable {
    case feed, prize, video, thumbsUp, podcasts
}
