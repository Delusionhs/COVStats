//
//  CountryListTableViewCell.swift
//  COVStats
//
//  Created by Igor Podolskiy on 24.09.2020.
//  Copyright © 2020 Igor Podolskiy. All rights reserved.
//
import UIKit

class CountryListTableViewCell: UITableViewCell {

    private enum CellLayoutOptions {
        static let flagImageHeight: CGFloat = 34.0
        static let flagImageWidth: CGFloat = 47.0
        static let flagImageHorisontalPadding: CGFloat = 10.0
        static let countryNameLabelVerticalPadding: CGFloat = 17.0
        static let trendingImageSize: CGFloat = 28
        static let trendingImageTrailingPadding: CGFloat = -10
        static let countlabelLeadingPadding: CGFloat = -4.0
        //static let margin: CGFloat = 10
    }

    private enum CellOptions {
        static let countryNameLabelFontSize:CGFloat = 22
        static let countNameLabelFontSize:CGFloat = 17
        static let layerBorderWidth: CGFloat = 1
        static let layerCornerRadius: CGFloat = 10
        static let layerBorderColor: CGColor = UIColor(hex: "#E4E4E4", alpha: 0.6).cgColor
        static let flagImageLayerBorderColor: CGColor = UIColor(hex: "#999999", alpha: 0.6).cgColor
    }

    let flagImage: UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFill
        imgView.layer.cornerRadius = CellOptions.layerCornerRadius
        imgView.layer.borderWidth = CellOptions.layerBorderWidth
        imgView.layer.borderColor = CellOptions.flagImageLayerBorderColor
        imgView.clipsToBounds = true
        return imgView
    }()

    let trendingImage: UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFill
        imgView.clipsToBounds = true
        return imgView
    }()

    let countryNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: CellOptions.countryNameLabelFontSize, weight: UIFont.Weight.light)
        return label
    }()

    let countLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: CellOptions.countNameLabelFontSize, weight: UIFont.Weight.semibold)
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupLayouts()
        setupBorder()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        //self.layer.frame = layer.frame.inset(by: UIEdgeInsets(top: 0, left: CellLayoutOption.margin, bottom: 0, right: CellLayoutOption.margin))
        //self.contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: CellLayoutOption.margin, bottom: 0, right: CellLayoutOption.margin*2))
    }

    private func setupViews() {
        contentView.addSubview(flagImage)
        contentView.addSubview(countryNameLabel)
        contentView.addSubview(trendingImage)
        contentView.addSubview(countLabel)
    }

    private func setupBorder() {
        layer.borderWidth = CellOptions.layerBorderWidth
        layer.cornerRadius = CellOptions.layerCornerRadius
        layer.borderColor = CellOptions.layerBorderColor
    }

    
    private func setupLayouts() {
        flagImage.translatesAutoresizingMaskIntoConstraints = false
        countryNameLabel.translatesAutoresizingMaskIntoConstraints = false
        trendingImage.translatesAutoresizingMaskIntoConstraints = false
        countLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            flagImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            flagImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: CellLayoutOptions.flagImageHorisontalPadding),
            flagImage.heightAnchor.constraint(equalToConstant: CellLayoutOptions.flagImageHeight),
            flagImage.widthAnchor.constraint(equalToConstant: CellLayoutOptions.flagImageWidth)
        ])

        NSLayoutConstraint.activate([
            countryNameLabel.centerYAnchor.constraint(equalTo: flagImage.centerYAnchor),
            countryNameLabel.leadingAnchor.constraint(equalTo: flagImage.trailingAnchor, constant: CellLayoutOptions.countryNameLabelVerticalPadding),
        ])

        NSLayoutConstraint.activate([
            trendingImage.centerYAnchor.constraint(equalTo: flagImage.centerYAnchor),
            trendingImage.heightAnchor.constraint(equalToConstant: CellLayoutOptions.trendingImageSize),
            trendingImage.widthAnchor.constraint(equalToConstant: CellLayoutOptions.trendingImageSize),
            trendingImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: CellLayoutOptions.trendingImageTrailingPadding)
        ])

        NSLayoutConstraint.activate([
            countLabel.centerYAnchor.constraint(equalTo: flagImage.centerYAnchor),
            countLabel.trailingAnchor.constraint(equalTo: trendingImage.leadingAnchor, constant: CellLayoutOptions.countlabelLeadingPadding),
        ])

        NSLayoutConstraint.activate([
            countryNameLabel.trailingAnchor.constraint(lessThanOrEqualTo: countLabel.leadingAnchor)
        ])
    }

    func configure(with viewModel: CountryListTableViewCellViewModel) {
        countryNameLabel.text = viewModel.country
        countLabel.text = viewModel.cases
        if let url = URL(string: viewModel.flagImageURL) {
            flagImage.setImage(with: url)
        }
        trendingImage.image = UIImage(named: "chevronDown")
    }
}

// MARK: - Helpers
extension CountryListTableViewCell {
    static var identifier: String {
        return String(describing: self)
    }
}

