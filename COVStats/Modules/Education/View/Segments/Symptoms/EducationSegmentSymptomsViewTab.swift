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
        static let sometimesImage = UIImage(named: "sometimesCircle")
        static let undeterminedImage = UIImage(named: "undeterminedCircle")
    }

    private enum LayoutOptions {
        static let symptomsStackViewWidth: CGFloat = 115
        static let textLeftPadding: CGFloat = 28
    }

    private let coldImageView = UIImageView()
    private let fluImageView = UIImageView()
    private let covidImageView = UIImageView()

    private var symptomsStackView: UIStackView

    override init(frame: CGRect) {
        symptomsStackView = UIStackView(arrangedSubviews: [coldImageView,fluImageView,covidImageView])
        super.init(frame: frame)
        setupStackView()
        setupViews()
        setupLayouts()
    }


    private func setupStackView() {
        coldImageView.contentMode = .scaleAspectFit
        coldImageView.image = ViewOptions.undeterminedImage


        fluImageView.contentMode = .scaleAspectFit
        fluImageView.image = ViewOptions.undeterminedImage

        let covidImageView = UIImageView()
        covidImageView.contentMode = .scaleAspectFit
        covidImageView.image = ViewOptions.undeterminedImage

        symptomsStackView.axis = .horizontal
        symptomsStackView.distribution = .equalSpacing
        symptomsStackView.alignment = .fill
    }


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

        NSLayoutConstraint.activate([
            symptomsStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            symptomsStackView.topAnchor.constraint(equalTo: topAnchor),
            symptomsStackView.widthAnchor.constraint(equalToConstant: LayoutOptions.symptomsStackViewWidth),
            symptomsStackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])

        NSLayoutConstraint.activate([
            textLabel.leadingAnchor.constraint(equalTo: symptomsStackView.trailingAnchor, constant: LayoutOptions.textLeftPadding),
            textLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            textLabel.centerYAnchor.constraint(equalTo: symptomsStackView.centerYAnchor)
        ])
    }

    private func imageFromFrequncy(frequency: Frequency) -> UIImage? {
        switch frequency {
        case .rare:
            return ViewOptions.rareImage
        case .sometimes:
            return ViewOptions.sometimesImage
        case .common:
            return ViewOptions.commonImage
        case .undetermined:
            return ViewOptions.undeterminedImage
        }
    }

    func configure(viewModel: EducationSegmentSymptomsViewTabViewModel) {
        guard viewModel.frequency.count == 3 else { return }

        coldImageView.image = imageFromFrequncy(frequency: viewModel.frequency[0])
        fluImageView.image = imageFromFrequncy(frequency: viewModel.frequency[1])
        covidImageView.image = imageFromFrequncy(frequency: viewModel.frequency[2])

        textLabel.text = viewModel.tabText
    }
}
