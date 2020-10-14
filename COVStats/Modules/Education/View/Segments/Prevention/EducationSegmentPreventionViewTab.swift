//
//  EducationSegmentPreventionViewTab.swift
//  COVStats
//
//  Created by Igor Podolskiy on 14.10.2020.
//  Copyright © 2020 Igor Podolskiy. All rights reserved.
//

import Foundation
import UIKit

class EducationSegmentPreventionViewTab: UIView {

    private enum TabOptions {
        static let titleLabelFontSize: CGFloat = 17
        static let textLabelFontSize: CGFloat = 13
        static let textLabelFontColor = UIColor(hex: "#999999")
    }

    private enum LayoutOptions {
        static let tabImageSideSize: CGFloat = 85
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupLayouts()
    }

    private let tabImage: UIImageView = {
        let imageView = UIImageView ()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.systemFont(ofSize: TabOptions.titleLabelFontSize, weight: UIFont.Weight.regular)
        return label
    }()

    private let textLabel: UILabel = {
        let label = UILabel()
        label.adjustsFontSizeToFitWidth = true
        label.textColor = TabOptions.textLabelFontColor
        label.font = UIFont.systemFont(ofSize: TabOptions.textLabelFontSize, weight: UIFont.Weight.regular)
        return label
    }()

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        addSubview(tabImage)
        addSubview(titleLabel)
        addSubview(textLabel)
    }

    private func setupLayouts() {
        tabImage.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        textLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            tabImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            tabImage.topAnchor.constraint(equalTo: topAnchor),
            tabImage.heightAnchor.constraint(equalToConstant: LayoutOptions.tabImageSideSize),
            tabImage.widthAnchor.constraint(equalToConstant: LayoutOptions.tabImageSideSize)
        ])
    }
    
}
