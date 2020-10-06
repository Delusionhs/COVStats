//
//  AppCoordinator.swift
//  COVStats
//
//  Created by Igor Podolskiy on 01.10.2020.
//  Copyright © 2020 Igor Podolskiy. All rights reserved.
//

import UIKit

fileprivate enum NavigationControllerKey: Int, CaseIterable {
    case home
    case news

    var title: String {
        switch self {
        case .home:
            return "Home"
        case .news:
            return "News"
        }
    }
}

class AppCoordinator {



    private let window: UIWindow
    private var tabBarController = UITabBarController()
    private var navigationController = UINavigationController()
    private let homeConfigurator: HomeConfiguratorProtocol = HomeConfigurator()

    private lazy var navigationControllers = AppCoordinator.makeNavigationControllers()

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
        navigationController.setViewControllers([homeConfigurator.assemblyModule()], animated: false)
        tabBarController.setViewControllers([navigationController], animated: false)
        navigationController.tabBarItem = UITabBarItem(title: "Home", image: UIImage(named: "homeTab"), selectedImage: UIImage(named: "homeTabSelected"))
    }

    static private func makeNavigationControllers() -> [NavigationControllerKey: UINavigationController] {
        var result: [NavigationControllerKey: UINavigationController] = [:]
        NavigationControllerKey.allCases.forEach { navControllerKey in
            let navigationController = UINavigationController()
            let tabBarItem = UITabBarItem(title: navControllerKey.title,
                                          image: UIImage(named: "homeTab"),
                                          tag: navControllerKey.rawValue)
            navigationController.tabBarItem = tabBarItem
            navigationController.navigationBar.prefersLargeTitles = true
            result[navControllerKey] = navigationController
        }
        return result
    }
}
