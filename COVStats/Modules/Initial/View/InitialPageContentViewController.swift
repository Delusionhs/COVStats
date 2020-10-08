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
        static let titleLabelFontSize: CGFloat = 28
        static let textLabelFontSize: CGFloat = 16
        static let textLabelFontColor = UIColor(hex: "#999999")
    }

    private enum LayoutOptions {
        static let pageControlBottomPadding: CGFloat = -20
        static let symptomImageTopPadding: CGFloat = 180
        static let titleLabelTopPadding: CGFloat = 80
        static let textHorizontalPadding: CGFloat = 25
        static let textLabelTopPadding: CGFloat = 14
    }

    private let symptomImage: UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFill
        imgView.clipsToBounds = true
        imgView.image = UIImage(named: "breathInitial")
        return imgView
    }()

    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: ViewOptions.titleLabelFontSize, weight: UIFont.Weight.semibold)
        label.text = "Fever"
        return label
    }()

    let textLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: ViewOptions.textLabelFontSize, weight: UIFont.Weight.light)
        label.textColor = ViewOptions.textLabelFontColor
        label.text = "He severity of COVID-19 symptoms can range from very mild to severe. Some people have no symptoms. People who are older or have existing chronic medical conditions."
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
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
        view.addSubview(titleLabel)
        view.addSubview(textLabel)

    }

    private func setupLayouts() {
        symptomImage.translatesAutoresizingMaskIntoConstraints = false
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        textLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            symptomImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            symptomImage.topAnchor.constraint(lessThanOrEqualTo: view.topAnchor, constant: LayoutOptions.symptomImageTopPadding),
            symptomImage.heightAnchor.constraint(equalToConstant: ViewOptions.symptomImageDimension),
            symptomImage.widthAnchor.constraint(equalToConstant: ViewOptions.symptomImageDimension)
        ])

        NSLayoutConstraint.activate([
            pageControl.topAnchor.constraint(greaterThanOrEqualTo: textLabel.bottomAnchor),
            pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pageControl.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: LayoutOptions.pageControlBottomPadding)
        ])

        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: symptomImage.bottomAnchor, constant: LayoutOptions.titleLabelTopPadding),
            textLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: LayoutOptions.textHorizontalPadding),
            textLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -LayoutOptions.textHorizontalPadding)
        ])

        NSLayoutConstraint.activate([
            textLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: LayoutOptions.textLabelTopPadding),
            textLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: LayoutOptions.textHorizontalPadding),
            textLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -LayoutOptions.textHorizontalPadding)
        ])

    }
}
