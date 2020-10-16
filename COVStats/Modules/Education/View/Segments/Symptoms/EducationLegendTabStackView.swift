//
//  EducationLegendTabStackView.swift
//  COVStats
//
//  Created by Igor Podolskiy on 16.10.2020.
//  Copyright © 2020 Igor Podolskiy. All rights reserved.
//

import UIKit

class EducationLegendTabStackView: UIStackView {

    private enum ViewOptions {
        static let legendTextLabel: CGFloat = 15
        static let legendTextLabelColor = UIColor(hex: "#999999")
        static let tabSpacing: CGFloat = 5
    }

    private let legendImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private let legendTextLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: ViewOptions.legendTextLabel, weight: UIFont.Weight.regular)
        label.textColor = ViewOptions.legendTextLabelColor
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    convenience init(legendImage: UIImage?, legendText: String) {
        self.init(frame: .zero)
        axis = .horizontal
        distribution = .equalSpacing
        alignment = .fill
        spacing = ViewOptions.tabSpacing
        legendTextLabel.text = legendText
        legendImageView.image = legendImage
        addArrangedSubview(legendImageView)
        addArrangedSubview(legendTextLabel)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
