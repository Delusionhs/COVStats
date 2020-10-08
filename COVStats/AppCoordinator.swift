//
//  AppCoordinator.swift
//  COVStats
//
//  Created by Igor Podolskiy on 01.10.2020.
//  Copyright © 2020 Igor Podolskiy. All rights reserved.
//

import UIKit

class AppCoordinator {

    private enum TabBarOptions {
        static let tintColor = UIColor(hex: "#FF647C")
    }

    private let window: UIWindow
    private var tabBarController = UITabBarController()
    private let homeConfigurator: HomeConfiguratorProtocol = HomeConfigurator()
    private let newsConfigurator: NewsConfiguratorProtocol = NewsConfigurator()
    private let educationConfigurator: EducationConfiguratorProtocol = EducationConfigurator()

    private lazy var navigationControllers = AppCoordinator.makeNavigationControllers()

    init(window: UIWindow) {
        self.window = window
    }

    func start() {
        setupHome()
        setupNews()
        setupEducation()
        setupTabBar()
        window.rootViewController = tabBarController 
        window.makeKeyAndVisible()
    }
}

extension AppCoordinator {

    private func setupTabBar() {
        tabBarController.tabBar.tintColor = TabBarOptions.tintColor
        let navigationControllers = NavigationControllerType.allCases.compactMap {
            self.navigationControllers[$0]
        }
        tabBarController.setViewControllers(navigationControllers, animated: true)
    }

    private func setupHome() {
        guard let navigationController = self.navigationControllers[.home] else {
            fatalError("can't find navigationController")
        }
        let viewController = homeConfigurator.assemblyModule()
        viewController.navigationItem.title = NavigationControllerType.home.navigationItemTitle
        navigationController.setViewControllers([viewController], animated: false)
    }

    private func setupNews() {
        guard let navigationController = self.navigationControllers[.news] else {
            fatalError("can't find navigationController")
        }
        let viewController = newsConfigurator.assemblyModule()
        viewController.navigationItem.title = NavigationControllerType.news.navigationItemTitle
        navigationController.setViewControllers([viewController], animated: false)
    }

    private func setupEducation() {
        guard let navigationController = self.navigationControllers[.education] else {
            fatalError("can't find navigationController")
        }
        let viewController = educationConfigurator.assemblyModule()
        viewController.navigationItem.title = NavigationControllerType.education.navigationItemTitle
        navigationController.setViewControllers([viewController], animated: false)
    }

    static private func makeNavigationControllers() -> [NavigationControllerType: UINavigationController] {
        var result: [NavigationControllerType: UINavigationController] = [:]
        NavigationControllerType.allCases.forEach { navigationControllerKey in
            let navigationController = UINavigationController()
            let tabBarItem = UITabBarItem(title: navigationControllerKey.tabBarTitle,
                                          image: UIImage(named: navigationControllerKey.imageName),
                                          tag: navigationControllerKey.rawValue)
            navigationController.tabBarItem = tabBarItem
            result[navigationControllerKey] = navigationController
        }
        return result
    }
}

extension AppCoordinator {
    private enum NavigationControllerType: Int, CaseIterable {
        case home
        case education
        case news

        var tabBarTitle: String {
            switch self {
            case .home:
                return "Home"
            case .news:
                return "News"
            case .education:
                return "Education"
            }
        }

        var navigationItemTitle: String {
            switch self {
            case .home:
                return "Covid-19"
            case .news:
                return "News"
            case .education:
                return "Education"
            }
        }

        var imageName: String {
            switch self {
            case .home:
                return "homeTab"
            case .news:
                return "newsTab"
            case .education:
                return "educationTab"
            }
        }
    }
}
