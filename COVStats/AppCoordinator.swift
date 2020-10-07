//
//  AppCoordinator.swift
//  COVStats
//
//  Created by Igor Podolskiy on 01.10.2020.
//  Copyright © 2020 Igor Podolskiy. All rights reserved.
//

import UIKit

fileprivate enum NavigationControllerType: Int, CaseIterable {
    case home
    case news

    var tabBarTitle: String {
        switch self {
        case .home:
            return "Home"
        case .news:
            return "News"
        }
    }

    var navigationItemTitle: String {
        switch self {
        case .home:
            return "Covid-19"
        case .news:
            return "News"
        }
    }
}

class AppCoordinator {



    private let window: UIWindow
    private var tabBarController = UITabBarController()
    private let homeConfigurator: HomeConfiguratorProtocol = HomeConfigurator()
    private let newsConfigurator: NewsConfiguratorProtocol = NewsConfigurator()

    private lazy var navigationControllers = AppCoordinator.makeNavigationControllers()

    init(window: UIWindow) {
        self.window = window
    }

    func start() {
        setupHome()
        setupNews()
        let navigationControllers = NavigationControllerType.allCases.compactMap {
            self.navigationControllers[$0]
        }
        tabBarController.setViewControllers(navigationControllers, animated: true)
        window.rootViewController = tabBarController 
        window.makeKeyAndVisible()
    }
}

extension AppCoordinator {
    func setupHome() {
        guard let navigationController = self.navigationControllers[.home] else {
            fatalError("can't find navController")
        }
        let viewController = homeConfigurator.assemblyModule()
        viewController.navigationItem.title = NavigationControllerType.home.navigationItemTitle
        navigationController.setViewControllers([viewController], animated: false)
    }

    func setupNews() {
        guard let navigationController = self.navigationControllers[.news] else {
            fatalError("can't find navController")
        }
        let viewController = newsConfigurator.assemblyModule()
        viewController.navigationItem.title = NavigationControllerType.news.navigationItemTitle
        navigationController.setViewControllers([viewController], animated: false)
    }

    static private func makeNavigationControllers() -> [NavigationControllerType: UINavigationController] {
        var result: [NavigationControllerType: UINavigationController] = [:]
        NavigationControllerType.allCases.forEach { navControllerKey in
            let navigationController = UINavigationController()
            let tabBarItem = UITabBarItem(title: navControllerKey.tabBarTitle,
                                          image: UIImage(named: "homeTab"),
                                          tag: navControllerKey.rawValue)
            navigationController.tabBarItem = tabBarItem
            result[navControllerKey] = navigationController
        }
        return result
    }
}
