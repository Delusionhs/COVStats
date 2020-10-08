//
//  InitialInitialViewController.swift
//  COVStats
//
//  Created by Igor Podolsiy on 09/10/2020.
//  Copyright © 2020 Igor Podolskiy. All rights reserved.
//

import UIKit

class InitialViewController: UIViewController, InitialViewInput, UIPageViewControllerDelegate {

    var output: InitialViewOutput!

    private let pageViewController = UIPageViewController()

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
        setupViews()
        setupPageController()
        setupLayouts()
    }

    private func setupPageController() {
        pageViewController.dataSource = self
        pageViewController.delegate = self
        addChild(pageViewController)
        view.addSubview(pageViewController.view)
        pageViewController.setViewControllers([InitialPageContentViewController()], direction: .forward, animated: true, completion: nil)
    }

    private func setupViews() {

//        view.backgroundColor = .white
//        view.addSubview(scrollView)
//        scrollView.addSubview(scrollViewContentView)
//        scrollViewContentView.addSubview(headerView)

    }

    private func setupLayouts() {
        pageViewController.view.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            pageViewController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            pageViewController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            pageViewController.view.topAnchor.constraint(equalTo: view.topAnchor),
            pageViewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])


    }
}

extension InitialViewController: UIPageViewControllerDataSource {

    // Переход на одну страницу назад
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerBefore viewController: UIViewController) -> UIViewController? {

        return InitialPageContentViewController()
    }

    // Перход на одну страницу вперед
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerAfter viewController: UIViewController) -> UIViewController? {

        return InitialPageContentViewController()
    }
}

