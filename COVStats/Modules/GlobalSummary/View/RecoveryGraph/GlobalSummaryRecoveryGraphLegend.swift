//
//  GlobalSummaryRecoveryGraphLegend.swift
//  COVStats
//
//  Created by Igor Podolskiy on 02.10.2020.
//  Copyright © 2020 Igor Podolskiy. All rights reserved.
//

import UIKit

class GlobalSummaryRecoveryGraphLegend: UIView {

    private enum ViewOptions {
        static let countLabelFontSize: CGFloat = 12
        static let nameLabelFontSize: CGFloat = 11

    }

    private enum LayoutOptions {

    }

    private let countLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: ViewOptions.countLabelFontSize, weight: UIFont.Weight.medium)
        return label
    }()

    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: ViewOptions.nameLabelFontSize, weight: UIFont.Weight.regular)
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
        self.addSubview(countLabel)
        self.addSubview(nameLabel)

    }

    private func setupLayouts() {
        countLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            countLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            countLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            countLabel.bottomAnchor.constraint(equalTo: centerYAnchor)
        ])

        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            nameLabel.topAnchor.constraint(equalTo: centerYAnchor)
        ])
    }

    func configure(count: Int, name: String) {
        countLabel.text = count.toStringWithDecimalStyle()
        nameLabel.text = name
    }
    
}
