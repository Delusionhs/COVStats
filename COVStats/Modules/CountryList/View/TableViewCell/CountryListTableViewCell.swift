//
//  CountryListTableViewCell.swift
//  COVStats
//
//  Created by Igor Podolskiy on 24.09.2020.
//  Copyright © 2020 Igor Podolskiy. All rights reserved.
//
import UIKit
import Kingfisher

class CountryListTableViewCell: UITableViewCell {

    private enum CellLayoutOption {
        static let flagImageHeight: CGFloat = 34.0
        static let flagImageWidth: CGFloat = 47.0
        static let flagImageHorisontalPadding: CGFloat = 10.0
        static let countryNameLabelVerticalPadding: CGFloat = 17.0
        static let trendingImageSize: CGFloat = 28
        static let trendingImageTrailingPadding: CGFloat = -10
        static let countlabelLeadingPadding: CGFloat = -4.0
        //static let margin: CGFloat = 10
    }

    private enum CellOption {
        static let countryNameLabelFontSize:CGFloat = 22
        static let countNameLabelFontSize:CGFloat = 17
        static let layerBorderWidth: CGFloat = 1
        static let layerCornerRadius: CGFloat = 10
        static let layerBorderColor: CGColor = UIColor(hex: "#999999", alpha: 0.6).cgColor
    }

    let flagImage: UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFill
        imgView.layer.cornerRadius = CellOption.layerCornerRadius
        imgView.layer.borderWidth = CellOption.layerBorderWidth
        imgView.layer.borderColor = CellOption.layerBorderColor
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
        label.font = UIFont.systemFont(ofSize: CellOption.countryNameLabelFontSize, weight: UIFont.Weight.light)
        return label
    }()

    let countLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: CellOption.countNameLabelFontSize, weight: UIFont.Weight.semibold)
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
        layer.borderWidth = CellOption.layerBorderWidth
        layer.cornerRadius = CellOption.layerCornerRadius
        layer.borderColor = CellOption.layerBorderColor
    }

    
    private func setupLayouts() {
        flagImage.translatesAutoresizingMaskIntoConstraints = false
        countryNameLabel.translatesAutoresizingMaskIntoConstraints = false
        trendingImage.translatesAutoresizingMaskIntoConstraints = false
        countLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            flagImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            flagImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: CellLayoutOption.flagImageHorisontalPadding),
            flagImage.heightAnchor.constraint(equalToConstant: CellLayoutOption.flagImageHeight),
            flagImage.widthAnchor.constraint(equalToConstant: CellLayoutOption.flagImageWidth)
        ])

        NSLayoutConstraint.activate([
            countryNameLabel.centerYAnchor.constraint(equalTo: flagImage.centerYAnchor),
            countryNameLabel.leadingAnchor.constraint(equalTo: flagImage.trailingAnchor, constant: CellLayoutOption.countryNameLabelVerticalPadding),
        ])

        NSLayoutConstraint.activate([
            trendingImage.centerYAnchor.constraint(equalTo: flagImage.centerYAnchor),
            trendingImage.heightAnchor.constraint(equalToConstant: CellLayoutOption.trendingImageSize),
            trendingImage.widthAnchor.constraint(equalToConstant: CellLayoutOption.trendingImageSize),
            trendingImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: CellLayoutOption.trendingImageTrailingPadding)
        ])

        NSLayoutConstraint.activate([
            countLabel.centerYAnchor.constraint(equalTo: flagImage.centerYAnchor),
            countLabel.trailingAnchor.constraint(equalTo: trendingImage.leadingAnchor, constant: CellLayoutOption.countlabelLeadingPadding),
        ])

        NSLayoutConstraint.activate([
            countryNameLabel.trailingAnchor.constraint(lessThanOrEqualTo: countLabel.leadingAnchor)
        ])
    }

    func configure(with viewModel: CountryListTableViewCellViewModel) {
        countryNameLabel.text = viewModel.country
        countLabel.text = viewModel.cases
        if let url = URL(string: viewModel.flagImageURL) {
            flagImage.kf.setImage(with: url)
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

