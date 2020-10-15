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
    }

    private enum ViewOptions {
        static let titleLabelFontSize: CGFloat = 28
    }

    private enum LayoutOptions {
        static let titleLeftPadding: CGFloat = 25
        static let titleRightPadding: CGFloat = -65
        static let titleBottomMargin: CGFloat = 20
    }

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: ViewOptions.titleLabelFontSize, weight: UIFont.Weight.semibold)
        label.numberOfLines = 0
        label.text = Localization.titleLabelText
        return label
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
    }

    private func setupLayouts() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: LayoutOptions.titleLeftPadding),
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: LayoutOptions.titleRightPadding),
        ])
    }
}




