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

    private let pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)

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
        view.backgroundColor = .white
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
        pageContentViewController.delegate = self
        return pageContentViewController
    }
}

extension InitialViewController: InitialViewInput {
    func configureInitPage(with viewModel: InitialPageContentViewModel) {
        let pageContentViewController = InitialPageContentViewController()
        pageContentViewController.configure(with: viewModel)
        pageContentViewController.delegate = self
        pageViewController.setViewControllers([pageContentViewController], direction: .forward, animated: true, completion: nil)
    }
}

extension InitialViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate {

    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewController = viewController as? InitialPageContentViewController else { return nil }
        let currentPage = viewController.currentPage()
        guard let viewModel = output.pageViewModelForPage(pageIndex: currentPage-1) else { return nil }
        return configurePageViewController(with: viewModel)
    }

    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewController = viewController as? InitialPageContentViewController else { return nil }
        let currentPage = viewController.currentPage()
        guard let viewModel = output.pageViewModelForPage(pageIndex: currentPage+1) else {
            output.skipInitial()
            return nil
        }
        return configurePageViewController(with: viewModel)
    }
}

extension InitialViewController: InitialPageContentViewControllerButtonDelegate {

    func nextButtonTap() {
        guard let viewController = pageViewController.viewControllers?[0] as? InitialPageContentViewController else { return }
        let currentPage = viewController.currentPage()
        guard let viewModel = output.pageViewModelForPage(pageIndex: currentPage+1) else {
            output.skipInitial()
            return }
        pageViewController.setViewControllers([configurePageViewController(with: viewModel)], direction: .forward, animated: true, completion: nil)
    }

    func skipButtonTap() {
        output.skipInitial()
    }
}
