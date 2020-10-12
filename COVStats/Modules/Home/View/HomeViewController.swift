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

    private enum ViewOptions {
        //issued in appcoordinator
        //static let navigationItemTitle = "Covid - 19"
    }

    private enum LayoutOptions {
        static let globalSummaryViewHeight: CGFloat = 920
        static let countryListViewMargin: CGFloat = 10
        static let countryListViewHeight: CGFloat = 670
        static let countryListViewTopMargin: CGFloat = 25
    }

    var output: HomeViewOutput!
    var globalSummaryViewController: UIViewController!
    var countryListViewController: UIViewController!

    private let scrollView = UIScrollView()
    private let scrollViewContentView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubViews()
        setupLayouts()
    }

    private func setupSubViews() {
        view.backgroundColor = .white
        view.addSubview(scrollView)
        scrollView.addSubview(scrollViewContentView)
        addChild(globalSummaryViewController)
        addChild(countryListViewController)
        scrollViewContentView.addSubview(globalSummaryViewController.view)
        scrollViewContentView.addSubview(countryListViewController.view)

    }

    private func setupLayouts() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollViewContentView.translatesAutoresizingMaskIntoConstraints = false
        globalSummaryViewController.view.translatesAutoresizingMaskIntoConstraints = false
        countryListViewController.view.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])

        NSLayoutConstraint.activate([
            scrollViewContentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollViewContentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollViewContentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            scrollViewContentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
        ])

        NSLayoutConstraint.activate([
            globalSummaryViewController.view.leadingAnchor.constraint(equalTo:  scrollViewContentView.leadingAnchor),
            globalSummaryViewController.view.trailingAnchor.constraint(equalTo:  scrollViewContentView.trailingAnchor),
            globalSummaryViewController.view.topAnchor.constraint(equalTo: scrollViewContentView.topAnchor),
            globalSummaryViewController.view.heightAnchor.constraint(equalToConstant: LayoutOptions.globalSummaryViewHeight)
        ])

        NSLayoutConstraint.activate([
            countryListViewController.view.topAnchor.constraint(equalTo: globalSummaryViewController.view.bottomAnchor, constant: LayoutOptions.countryListViewTopMargin),
            countryListViewController.view.heightAnchor.constraint(equalToConstant: LayoutOptions.countryListViewHeight),
            countryListViewController.view.bottomAnchor.constraint(equalTo: scrollViewContentView.bottomAnchor),
            countryListViewController.view.leadingAnchor.constraint(equalTo:  scrollViewContentView.leadingAnchor, constant: LayoutOptions.countryListViewMargin),
            countryListViewController.view.trailingAnchor.constraint(equalTo:  scrollViewContentView.trailingAnchor,constant: -LayoutOptions.countryListViewMargin)
        ])
    }


}
