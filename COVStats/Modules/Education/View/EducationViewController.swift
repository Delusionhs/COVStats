//
//  EducationEducationViewController.swift
//  COVStats
//
//  Created by Igor Podolsiy on 07/10/2020.
//  Copyright © 2020 Igor Podolskiy. All rights reserved.
//

import UIKit

class EducationViewController: UIViewController{

    var output: EducationViewOutput!

    private let headerView = EducationHeaderView()
    private let scrollView = UIScrollView()
    private let scrollViewContentView = UIView()

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
        headerView.delegate = self
        setupViews()
        setupLayouts()
    }

    private func setupViews() {
        view.backgroundColor = .white
        view.addSubview(scrollView)
        scrollView.addSubview(scrollViewContentView)
        scrollViewContentView.addSubview(headerView)

    }

    private func setupLayouts() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollViewContentView.translatesAutoresizingMaskIntoConstraints = false
        headerView.translatesAutoresizingMaskIntoConstraints = false

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
            headerView.leadingAnchor.constraint(equalTo: scrollViewContentView.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: scrollViewContentView.trailingAnchor),
            headerView.topAnchor.constraint(equalTo: scrollViewContentView.topAnchor),
            headerView.bottomAnchor.constraint(equalTo: scrollViewContentView.bottomAnchor)
        ])

    }
}

extension EducationViewController: EducationViewInput {

}

extension EducationViewController: EducationHeaderViewButtonDelegate {
    func seeMoreButtonTap() {
        output.seeMoreButtonPressed()
    }
}
