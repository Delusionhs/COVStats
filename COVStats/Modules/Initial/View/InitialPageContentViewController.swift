//
//  InitialPageContentViewController.swift
//  COVStats
//
//  Created by Igor Podolskiy on 09.10.2020.
//  Copyright © 2020 Igor Podolskiy. All rights reserved.
//

import UIKit

class InitialPageContentViewController: UIViewController {

    private enum ViewOptions {
        static let symptomImageDimension: CGFloat = 260
        static let pageControlSelectedColor = UIColor(hex: "#FF647C")
        static let pageControlUnselectedColor = UIColor(hex: "#E4E4E4")
    }

    private let symptomImage: UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFill
        imgView.clipsToBounds = true
        imgView.image = UIImage(named: "breathInitial")
        return imgView
    }()

    private let pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.currentPage = 0
        pageControl.numberOfPages = 3
        pageControl.pageIndicatorTintColor = ViewOptions.pageControlUnselectedColor
        pageControl.currentPageIndicatorTintColor = ViewOptions.pageControlSelectedColor
        return pageControl
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupLayouts()
    }

    private func setupViews() {
        view.backgroundColor = .white
        view.addSubview(symptomImage)
        view.addSubview(pageControl)

    }

    private func setupLayouts() {
        symptomImage.translatesAutoresizingMaskIntoConstraints = false
        pageControl.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
//            symptomImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            symptomImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            symptomImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
//            symptomImage.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            symptomImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            symptomImage.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            symptomImage.heightAnchor.constraint(equalToConstant: ViewOptions.symptomImageDimension),
            symptomImage.widthAnchor.constraint(equalToConstant: ViewOptions.symptomImageDimension)
        ])

        NSLayoutConstraint.activate([
//            symptomImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            symptomImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            symptomImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
//            symptomImage.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pageControl.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
        ])


    }
}
