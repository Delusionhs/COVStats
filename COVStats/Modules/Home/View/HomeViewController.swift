//
//  HomeViewConroller.swift
//  COVStats
//
//  Created by Igor Podolskiy on 21.09.2020.
//  Copyright © 2020 Igor Podolskiy. All rights reserved.
//

import Foundation
import UIKit

class HomeViewController: UIViewController, HomeViewInput {

    private enum LayoutOptions {
        static let globalSummaryViewControllerHeight: CGFloat = 500
        static let countryListViewControllerMargin: CGFloat = 10
    }

    var output: HomeViewOutput!
    var globalSummaryViewController: UIViewController!
    var countryListViewController: UIViewController!

    private let configurator: HomeConfiguratorProtocol = HomeConfigurator()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        configurator.configure(with: self)
        setupSubViewControllers()
        setupLayouts()
    }

    private func setupSubViewControllers() {
        addChild(globalSummaryViewController)
        addChild(countryListViewController)
        view.addSubview(globalSummaryViewController.view)
        view.addSubview(countryListViewController.view)

    }

    private func setupLayouts() {
        globalSummaryViewController.view.translatesAutoresizingMaskIntoConstraints = false
        countryListViewController.view.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            globalSummaryViewController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            globalSummaryViewController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            globalSummaryViewController.view.topAnchor.constraint(equalTo: view.topAnchor),
            globalSummaryViewController.view.heightAnchor.constraint(equalToConstant: LayoutOptions.globalSummaryViewControllerHeight)
        ])

        NSLayoutConstraint.activate([
            countryListViewController.view.topAnchor.constraint(equalTo: globalSummaryViewController.view.bottomAnchor),
            countryListViewController.view.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            countryListViewController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: LayoutOptions.countryListViewControllerMargin),
            countryListViewController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -LayoutOptions.countryListViewControllerMargin)
        ])
    }


}
