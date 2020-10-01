//
//  CountryDetailHeaderView.swift
//  COVStats
//
//  Created by Igor Podolskiy on 01.10.2020.
//  Copyright © 2020 Igor Podolskiy. All rights reserved.
//

import UIKit

class CountryDetailHeaderView: UIView {
    private enum ViewOptions {
        static let flagImageLayerBorderWidth: CGFloat = 1
        static let flagImageLayerCornerRadius: CGFloat = 10
        static let flagImageLayerBorderColor: CGColor = UIColor(hex: "#999999", alpha: 0.6).cgColor
        static let countryNameLabelFontSize: CGFloat = 22
        static let casesLabelFontSize: CGFloat = 28
        static let todayCasesLabelFontSize: CGFloat = 22
        static let todayTextColor = UIColor(hex: "#999999")
        static let casesCountTextColor = UIColor(hex: "#00C48C")
        static let deathCountTextColor = UIColor(hex: "#FF647C")
        static let layerBorderWidth: CGFloat = 1
        static let layerBorderCornerRadius: CGFloat = 10
        static let layerBorderColor: CGColor = UIColor(hex: "#999999", alpha: 0.6).cgColor
    }

    private enum LayoutOptions {
        static let flagImageHeight: CGFloat = 34
        static let flagImageWidth: CGFloat = 47.0
        static let flagImagePadding: CGFloat = 17
        static let countryNameLabelVerticalPadding: CGFloat = 25
        static let textLeading: CGFloat = 17
        static let casesCountLabelTopPadding: CGFloat = 13
        static let deathCountLabelTopPadding: CGFloat = 25
        static let todayTextTopPadding: CGFloat = 5
    }

    private let flagImage: UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFill
        imgView.layer.cornerRadius = ViewOptions.flagImageLayerCornerRadius
        imgView.layer.borderWidth = ViewOptions.flagImageLayerBorderWidth
        imgView.layer.borderColor = ViewOptions.flagImageLayerBorderColor
        imgView.clipsToBounds = true
        return imgView
    }()

    private let countryNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: ViewOptions.countryNameLabelFontSize, weight: UIFont.Weight.regular)
        return label
    }()

    private let casesCountLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: ViewOptions.casesLabelFontSize, weight: UIFont.Weight.semibold)
        label.textColor = ViewOptions.casesCountTextColor
        return label
    }()

    private let todayCasesCountLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: ViewOptions.todayCasesLabelFontSize, weight: UIFont.Weight.regular)
        label.textColor = ViewOptions.todayTextColor
        return label
    }()

    private let deathCountLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: ViewOptions.casesLabelFontSize, weight: UIFont.Weight.semibold)
        label.textColor = ViewOptions.deathCountTextColor
        return label
    }()

    private let todayDeathCountLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: ViewOptions.todayCasesLabelFontSize, weight: UIFont.Weight.regular)
        label.textColor = ViewOptions.todayTextColor
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupLayouts()
        setupBorder()
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        addSubview(flagImage)
        addSubview(countryNameLabel)
        addSubview(casesCountLabel)
        addSubview(todayCasesCountLabel)
        addSubview(deathCountLabel)
        addSubview(todayDeathCountLabel)
    }

    private func setupLayouts() {
        flagImage.translatesAutoresizingMaskIntoConstraints = false
        countryNameLabel.translatesAutoresizingMaskIntoConstraints = false
        casesCountLabel.translatesAutoresizingMaskIntoConstraints = false
        todayCasesCountLabel.translatesAutoresizingMaskIntoConstraints = false
        deathCountLabel.translatesAutoresizingMaskIntoConstraints = false
        todayDeathCountLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            flagImage.heightAnchor.constraint(equalToConstant: LayoutOptions.flagImageHeight),
            flagImage.widthAnchor.constraint(equalToConstant: LayoutOptions.flagImageWidth),
            flagImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: LayoutOptions.flagImagePadding),
            flagImage.topAnchor.constraint(equalTo: self.topAnchor, constant: LayoutOptions.flagImagePadding)
        ])

        NSLayoutConstraint.activate([
            countryNameLabel.centerYAnchor.constraint(equalTo: flagImage.centerYAnchor),
            countryNameLabel.leadingAnchor.constraint(equalTo: flagImage.trailingAnchor, constant: LayoutOptions.countryNameLabelVerticalPadding),
        ])

        NSLayoutConstraint.activate([
            casesCountLabel.topAnchor.constraint(equalTo: flagImage.bottomAnchor, constant: LayoutOptions.casesCountLabelTopPadding),
            casesCountLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: LayoutOptions.textLeading)
        ])

        NSLayoutConstraint.activate([
            todayCasesCountLabel.topAnchor.constraint(equalTo: casesCountLabel.bottomAnchor, constant: LayoutOptions.todayTextTopPadding),
            todayCasesCountLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: LayoutOptions.textLeading)
        ])

        NSLayoutConstraint.activate([
            deathCountLabel.topAnchor.constraint(equalTo: todayCasesCountLabel.bottomAnchor, constant: LayoutOptions.deathCountLabelTopPadding),
            deathCountLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: LayoutOptions.textLeading)
        ])

        NSLayoutConstraint.activate([
            todayDeathCountLabel.topAnchor.constraint(equalTo: deathCountLabel.bottomAnchor, constant: LayoutOptions.todayTextTopPadding),
            todayDeathCountLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: LayoutOptions.textLeading)
        ])

    }

    private func setupBorder() {
        layer.borderWidth = ViewOptions.layerBorderWidth
        layer.cornerRadius = ViewOptions.layerBorderCornerRadius
        layer.borderColor = ViewOptions.layerBorderColor
    }

    func configure(flagImageData: UIImage,
                   countryName: String,
                   casesCountText: String,
                   todayCasesCountText: String,
                   deathCountText: String,
                   todayDeathCountText: String) {
        flagImage.image = flagImageData
        countryNameLabel.text = countryName
        casesCountLabel.text = casesCountText
        todayCasesCountLabel.text = todayCasesCountText
        deathCountLabel.text = deathCountText
        todayDeathCountLabel.text = todayCasesCountText
    }
}

