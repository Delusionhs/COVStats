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
    private lazy var tabBarController = UITabBarController()
    private var navigationControllers = UINavigationController()

    init(window: UIWindow) {
        self.window = window
    }

    func start() {
        let viewController = HomeViewController() //init VC
        window.rootViewController = viewController // associate VC as root VC
        window.makeKeyAndVisible()
    }
}

extension AppCoordinator {
}

fileprivate enum NavControllerType: Int, CaseIterable {
    case feed, prize, video, thumbsUp, podcasts
}
