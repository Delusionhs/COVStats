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
    private var tabBarController = UITabBarController()
    private var navigationControllers = UINavigationController()
    private let homeConfigurator: HomeConfiguratorProtocol = HomeConfigurator()

    init(window: UIWindow) {
        self.window = window
    }

    func start() {
        setupHome()
        window.rootViewController = tabBarController 
        window.makeKeyAndVisible()
    }
}

extension AppCoordinator {
    func setupHome() {
        navigationControllers.setViewControllers([homeConfigurator.assemblyModule()], animated: false)
        tabBarController.setViewControllers([navigationControllers], animated: false)
        navigationControllers.tabBarItem = UITabBarItem(title: "Home", image: UIImage(named: "homeTab"), selectedImage: UIImage(named: "homeTabSelected"))
    }
}
