//
//  EducationSegmentSymptomsView.swift
//  COVStats
//
//  Created by Igor Podolskiy on 13.10.2020.
//  Copyright © 2020 Igor Podolskiy. All rights reserved.
//


import Foundation
import UIKit

class EducationSegmentSymptomsView: UIView {

    private enum Localization {
        static let titleLabelText = "Symptom Check"
        static let subTitleLabelText = "Check your symptoms for"
    }

    private enum ViewOptions {
        static let titleLabelFontSize: CGFloat = 28
        static let subTitleLabelFontSize: CGFloat = 16
        static let subTitleLabelColor = UIColor(hex: "#999999")
        static let symptomsLegendImage = UIImage(named: "symptomsGold")
    }

    private enum LayoutOptions {
        static let elementsLeftPadding: CGFloat = 25
        static let elementsRightPadding: CGFloat = -65
        static let subTitleTopPadding: CGFloat = 20
        static let symptomsImageTopPadding: CGFloat = 10
    }

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: ViewOptions.titleLabelFontSize, weight: UIFont.Weight.semibold)
        label.text = Localization.titleLabelText
        return label
    }()

    private let subTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: ViewOptions.subTitleLabelFontSize, weight: UIFont.Weight.light)
        label.textColor = ViewOptions.subTitleLabelColor
        label.text = Localization.subTitleLabelText
        return label
    }()

    private let symptomsLegendImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = ViewOptions.symptomsLegendImage
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    private let symtomsHeaderStackView:UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 5
        return stackView
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
        addSubview(subTitleLabel)
        addSubview(symptomsLegendImage)
    }

    private func setupLayouts() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        subTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        symptomsLegendImage.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: LayoutOptions.elementsLeftPadding),
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: LayoutOptions.elementsRightPadding),
        ])

        NSLayoutConstraint.activate([
            subTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: LayoutOptions.elementsLeftPadding),
            subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: LayoutOptions.subTitleTopPadding),
            subTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: LayoutOptions.elementsRightPadding),
        ])

        NSLayoutConstraint.activate([
            symptomsLegendImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: LayoutOptions.elementsLeftPadding),
            symptomsLegendImage.topAnchor.constraint(equalTo: subTitleLabel.bottomAnchor, constant: LayoutOptions.symptomsImageTopPadding),
            symptomsLegendImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -LayoutOptions.elementsLeftPadding),
        ])
    }
}




