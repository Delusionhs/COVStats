//
//  InitialInitialViewController.swift
//  COVStats
//
//  Created by Igor Podolsiy on 09/10/2020.
//  Copyright © 2020 Igor Podolskiy. All rights reserved.
//

import UIKit

class InitialViewController: UIViewController {

    var output: InitialViewOutput!

    private let pageViewController = UIPageViewController()
    private var currentPageNumber = 0
    private let pageCount = 0

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
        setupPageController()
        setupViews()
        setupLayouts()
    }

    private func setupPageController() {
        pageViewController.dataSource = self
        pageViewController.delegate = self
        addChild(pageViewController)
        view.addSubview(pageViewController.view)
    }

    private func setupViews() {
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

    private func configurePageViewController(with viewModel: InitialPageContentViewModel) -> InitialPageContentViewController {
        let pageContentViewController = InitialPageContentViewController()
        pageContentViewController.configure(with: viewModel)
        return pageContentViewController
    }
}

extension InitialViewController: InitialViewInput {
    func configureInitPage(with viewModel: InitialPageContentViewModel) {
        let pageContentViewController = InitialPageContentViewController()
        pageContentViewController.configure(with: viewModel)
        pageViewController.setViewControllers([pageContentViewController], direction: .forward, animated: true, completion: nil)
    }
}

extension InitialViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate {

    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard currentPageNumber > 0 else {
            return nil
        }
        currentPageNumber -= 1
        guard let viewModel = output.pageViewModelForPage(pageIndex: currentPageNumber) else { return nil }

        return configurePageViewController(with: viewModel)
    }

    // Перход на одну страницу вперед
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard currentPageNumber < output.pagesMaxIndex() else {
            return nil
        }
        currentPageNumber += 1
        guard let viewModel = output.pageViewModelForPage(pageIndex: currentPageNumber) else { return nil }

        return configurePageViewController(with: viewModel)
    }
}

