//
//  EducationBodyView.swift
//  COVStats
//
//  Created by Igor Podolskiy on 12.10.2020.
//  Copyright © 2020 Igor Podolskiy. All rights reserved.
//

import Foundation
import UIKit

class EducationSegmentPreventionView: UIView {

    private enum Localization {
        static let titleLabelText = "Basic protective measures against the new coronavirus"
    }

    private enum ViewOptions {
        static let titleLabelFontSize: CGFloat = 28
    }

    private enum LayoutOptions {
        static let segmentedControlBarHeight:CGFloat = 5
        static let titleLeftPadding: CGFloat = 25
        static let titleRightPadding: CGFloat = -65
    }

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: ViewOptions.titleLabelFontSize, weight: UIFont.Weight.semibold)
        label.numberOfLines = 0
        label.text = Localization.titleLabelText
        return label
    }()

    let tab = EducationSegmentPreventionViewTab()


    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupTabs()
        setupLayouts()
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        addSubview(titleLabel)
    }

    private func setupTabs() {
        tab.configure(viewModel: EducationSegmentPreventionViewTabViewModel(imageName: "preventionFace", titleText: "Clean your hands often",
                                                            tabText: "Wash hands often with soap and water for at least 20s"))
        addSubview(tab)
    }

    private func setupLayouts() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        tab.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: LayoutOptions.titleLeftPadding),
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: LayoutOptions.titleRightPadding),
        ])

        NSLayoutConstraint.activate([
            tab.leadingAnchor.constraint(equalTo: leadingAnchor),
            tab.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            tab.trailingAnchor.constraint(equalTo: trailingAnchor),
            tab.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}



