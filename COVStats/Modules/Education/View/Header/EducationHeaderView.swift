//
//  EducationHeaderView.swift
//  COVStats
//
//  Created by Igor Podolskiy on 07.10.2020.
//  Copyright © 2020 Igor Podolskiy. All rights reserved.
//

import UIKit

protocol EducationHeaderViewButtonDelegate: class {
    func seeMoreButtonTap()
}

class EducationHeaderView: UIView {

    private enum Localization {
        static let titleLabelText = "Coronavirus disease (COVID - 19) advice for the public"
        static let textLabelText = "Stay aware of the latest information on the COVID-19 outbreak, available on the WHO website and through your national and local public health authority. Most people who become infected experience mild illness and recover, but it can be more severe for others. Take care of your health and protect others by doing the following:"
    }

    private enum ViewOptions {
        static let titleLabelFontSize: CGFloat = 28
        static let titleLabelNumberOfLines = 0
        static let textLabelFontSize: CGFloat = 16
        static let textLabelNumberOfLines = 0
        static let textLabelFontColor = UIColor(hex: "#999999")
        static let seeMoreButtonImage = UIImage(named: "seeMoreButton")

    }

    private enum LayoutOptions {
        static let titleLabelTopPadding: CGFloat =  45
        static let textLabelTopPadding: CGFloat = 20
        static let elementsLeftPadding: CGFloat = 25
        static let elementsRightPadding: CGFloat = -40
        static let seeMoreButtonTopPadding: CGFloat = 25
    }

    weak var delegate: EducationHeaderViewButtonDelegate?

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = Localization.titleLabelText
        label.numberOfLines = ViewOptions.titleLabelNumberOfLines
        label.font = UIFont.systemFont(ofSize: ViewOptions.titleLabelFontSize, weight: UIFont.Weight.semibold)
        return label
    }()

    private let textLabel: UILabel = {
        let label = UILabel()
        label.text = Localization.textLabelText
        label.numberOfLines = ViewOptions.textLabelNumberOfLines
        label.font = UIFont.systemFont(ofSize: ViewOptions.textLabelFontSize, weight: UIFont.Weight.regular)
        label.textColor = ViewOptions.textLabelFontColor
        return label
    }()

    private let seeMoreButton: UIButton = {
        let button = UIButton()
        button.setImage(ViewOptions.seeMoreButtonImage, for: .normal)
        button.addTarget(self, action: #selector(seeMoreButtonAction), for: .touchUpInside)
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupLayouts()
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        addSubview(titleLabel)
        addSubview(textLabel)
        addSubview(seeMoreButton)
    }

    private func setupLayouts() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        seeMoreButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: LayoutOptions.titleLabelTopPadding),
            titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: LayoutOptions.elementsLeftPadding),
            titleLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: LayoutOptions.elementsRightPadding)
        ])

        NSLayoutConstraint.activate([
            textLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: LayoutOptions.textLabelTopPadding),
            textLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: LayoutOptions.elementsLeftPadding),
            textLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: LayoutOptions.elementsRightPadding)
        ])

        NSLayoutConstraint.activate([
            seeMoreButton.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: LayoutOptions.seeMoreButtonTopPadding),
            seeMoreButton.leftAnchor.constraint(equalTo: leftAnchor, constant: LayoutOptions.elementsLeftPadding),
            seeMoreButton.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor)
        ])

    }

}

extension EducationHeaderView {
    @objc func seeMoreButtonAction() {
        delegate?.seeMoreButtonTap()
    }
}
