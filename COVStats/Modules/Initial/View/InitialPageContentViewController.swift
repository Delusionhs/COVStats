//
//  InitialPageContentViewController.swift
//  COVStats
//
//  Created by Igor Podolskiy on 09.10.2020.
//  Copyright © 2020 Igor Podolskiy. All rights reserved.
//

protocol InitialPageContentViewControllerButtonTapDelegate: class {
    func nextButtonTap()
    func skipButtonTap()
}

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

    private enum Localization {
        static let nextButtonTitle = "Next"
        static let skipButtonTitle = "Skip"
    }

    weak var delegate: InitialPageContentViewControllerButtonTapDelegate?

    private let symptomImage: UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFill
        imgView.clipsToBounds = true
        return imgView
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: ViewOptions.titleLabelFontSize, weight: UIFont.Weight.semibold)
        label.textAlignment = .center
        return label
    }()

    private let textLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: ViewOptions.textLabelFontSize, weight: UIFont.Weight.light)
        label.textColor = ViewOptions.textLabelFontColor
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()

    private let pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.pageIndicatorTintColor = ViewOptions.pageControlUnselectedColor
        pageControl.currentPageIndicatorTintColor = ViewOptions.pageControlSelectedColor
        return pageControl
    }()

    private let nextButton: UIButton = {
        let button = UIButton()
        button.setTitle(Localization.nextButtonTitle, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(nextButtonAction), for: .touchUpInside)
        return button
    }()

    private let skipButton: UIButton = {
        let button = UIButton()
        button.setTitle(Localization.skipButtonTitle, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(skipButtonAction), for: .touchUpInside)
        return button
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
        view.addSubview(nextButton)
        view.addSubview(skipButton)
    }

    private func setupLayouts() {
        symptomImage.translatesAutoresizingMaskIntoConstraints = false
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        skipButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            symptomImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            symptomImage.topAnchor.constraint(lessThanOrEqualTo: view.topAnchor, constant: LayoutOptions.symptomImageTopPadding),
            symptomImage.heightAnchor.constraint(equalToConstant: ViewOptions.symptomImageDimension),
            symptomImage.widthAnchor.constraint(equalToConstant: ViewOptions.symptomImageDimension)
        ])

        NSLayoutConstraint.activate([
            pageControl.topAnchor.constraint(equalTo: textLabel.bottomAnchor),
            pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pageControl.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: LayoutOptions.pageControlBottomPadding)
        ])

        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.topAnchor.constraint(lessThanOrEqualTo: symptomImage.bottomAnchor, constant: LayoutOptions.titleLabelTopPadding),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: LayoutOptions.textHorizontalPadding),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -LayoutOptions.textHorizontalPadding)
        ])

        NSLayoutConstraint.activate([
            textLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: LayoutOptions.textLabelTopPadding),
            textLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: LayoutOptions.textHorizontalPadding),
            textLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -LayoutOptions.textHorizontalPadding)
        ])

        NSLayoutConstraint.activate([
            nextButton.centerYAnchor.constraint(equalTo: pageControl.centerYAnchor),
            nextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -LayoutOptions.textHorizontalPadding),
            nextButton.leadingAnchor.constraint(greaterThanOrEqualTo: pageControl.trailingAnchor)
        ])

        NSLayoutConstraint.activate([
            skipButton.centerYAnchor.constraint(equalTo: pageControl.centerYAnchor),
            skipButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: LayoutOptions.textHorizontalPadding),
            skipButton.trailingAnchor.constraint(lessThanOrEqualTo: pageControl.leadingAnchor)
        ])

    }

    func configure(with viewModel: InitialPageContentViewModel) {
        symptomImage.image = UIImage(named: viewModel.imageName)
        titleLabel.text = viewModel.title
        textLabel.text = viewModel.text
        pageControl.numberOfPages = viewModel.pagesCount
        pageControl.currentPage = viewModel.currentPage
    }

    func currentPage() -> Int {
        return pageControl.currentPage
    }
}

//MARK: - UI Actions

extension InitialPageContentViewController {
    @objc func skipButtonAction() {
        delegate?.skipButtonTap()
    }

    @objc func nextButtonAction() {
        delegate?.nextButtonTap()
    }
}
