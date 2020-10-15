//
//  EducationSegmentSymptomsViewTab.swift
//  COVStats
//
//  Created by Igor Podolskiy on 16.10.2020.
//  Copyright © 2020 Igor Podolskiy. All rights reserved.
//

import Foundation
import UIKit

class EducationSegmentSymptomsViewTab: UIView {
    private enum ViewOptions {
        static let textLabelFontSize: CGFloat = 20
        static let textLabelFontColor = UIColor(hex: "#999999")
        static let commonImage = UIImage(named: "commonCircle")
        static let rareImage = UIImage(named: "rareCircle")
        static let sometimesImage = UIImage(named: "sometimesCOVID")
        static let undeterminedImage = UIImage(named: "undeterminedCircle")
    }

    private enum LayoutOptions {
        static let symptomsStackViewWidth: CGFloat = 115
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupLayouts()
    }

    private let coldImageView = UIImageView()

    private let symptomsStackView:UIStackView = {
        let coldImageView = UIImageView()
        coldImageView.contentMode = .scaleAspectFit
        coldImageView.image = ViewOptions.undeterminedImage

        let fluImageView = UIImageView()
        fluImageView.contentMode = .scaleAspectFit
        fluImageView.image = ViewOptions.undeterminedImage

        let covidImageView = UIImageView()
        covidImageView.contentMode = .scaleAspectFit
        covidImageView.image = ViewOptions.undeterminedImage

        let stackView = UIStackView(arrangedSubviews: [coldImageView,fluImageView,covidImageView])
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.alignment = .fill
        return stackView
    }()


    private let textLabel: UILabel = {
        let label = UILabel()
        label.adjustsFontSizeToFitWidth = true
        label.textColor = ViewOptions.textLabelFontColor
        label.font = UIFont.systemFont(ofSize: ViewOptions.textLabelFontSize, weight: UIFont.Weight.regular)
        return label
    }()

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        addSubview(symptomsStackView)
        addSubview(textLabel)
    }

    private func setupLayouts() {
        symptomsStackView.translatesAutoresizingMaskIntoConstraints = false
        textLabel.translatesAutoresizingMaskIntoConstraints = false

        textLabel.text = "TEST TEST"

        NSLayoutConstraint.activate([
            symptomsStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            symptomsStackView.topAnchor.constraint(equalTo: topAnchor),
            symptomsStackView.widthAnchor.constraint(equalToConstant: LayoutOptions.symptomsStackViewWidth),
            symptomsStackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])

        NSLayoutConstraint.activate([
            textLabel.leadingAnchor.constraint(equalTo: symptomsStackView.trailingAnchor),
            textLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            textLabel.centerYAnchor.constraint(equalTo: symptomsStackView.centerYAnchor)
        ])
    }

    func configure(viewModel: EducationSegmentPreventionViewTabViewModel) {
//        tabImage.image = UIImage(named: viewModel.imageName)
//        titleLabel.text = viewModel.titleText
//        textLabel.text = viewModel.tabText
    }
}
