//
//  GlobalSummaryCollectionViewCell.swift
//  COVStats
//
//  Created by Igor Podolskiy on 22.09.2020.
//  Copyright © 2020 Igor Podolskiy. All rights reserved.
//

import Foundation
import UIKit

final class GlobalSummaryCollectionViewCell: UICollectionViewCell {

    private enum CellLayoutOptions {
        static let titleVerticalPadding: CGFloat = 28
        static let titleHorizontalPadding: CGFloat = 10
        static let imageHorizontalPadding: CGFloat = 10
        static let casesCountLabelHorizontalPadding: CGFloat = 10
        static let casesCountLabelVerticalPadding: CGFloat = 10
    }

    private enum CellOptions {
        static let labelTextNumberOfLines = 1
        static let titleFontSize:CGFloat = 17
        static let casesCountLabelFontSize: CGFloat = 28
        static let layerBorderWidth: CGFloat = 1
        static let layerCornerRadius: CGFloat = 10
        static let trendingUpImageName = "trendingUpRed"
        static let trendingDownImageName = "trendingUpGreen"
        static let layerBorderColor: CGColor = UIColor(hex: "#E4E4E4", alpha: 0.6).cgColor
    }

    private let trendingImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    private let title: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: CellOptions.titleFontSize, weight: UIFont.Weight.regular)
        label.numberOfLines = CellOptions.labelTextNumberOfLines
        return label
    }()

    private let casesCountLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: CellOptions.casesCountLabelFontSize, weight: UIFont.Weight.semibold)
        label.numberOfLines = CellOptions.labelTextNumberOfLines
        return label
       }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupLayouts()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Setup Layout
extension GlobalSummaryCollectionViewCell {

    private func setup(title: String, count: Int, trending: Trending) {
        self.title.text = title
        self.casesCountLabel.text = String(count)
        self.trendingImageView.image = getImageForTrending(trending: trending)
    }

    private func setupViews() {
        addSubview(casesCountLabel)
        addSubview(title)
        addSubview(trendingImageView)

        title.text = "Total Cases"
        casesCountLabel.text = "360,524"
        trendingImageView.image = getImageForTrending(trending: .down)
        setupBorder()
    }

    private func setupBorder() {
        contentView.layer.borderWidth = CellOptions.layerBorderWidth
        contentView.layer.cornerRadius = CellOptions.layerCornerRadius
        contentView.layer.borderColor = CellOptions.layerBorderColor
    }

    private func setupLayouts() {
        title.translatesAutoresizingMaskIntoConstraints = false
        trendingImageView.translatesAutoresizingMaskIntoConstraints = false
        casesCountLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            title.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: CellLayoutOptions .titleHorizontalPadding),
            title.trailingAnchor.constraint(equalTo: trendingImageView.leadingAnchor, constant: CellLayoutOptions .titleHorizontalPadding),
            title.topAnchor.constraint(equalTo: contentView.topAnchor, constant: CellLayoutOptions.titleVerticalPadding)
        ])

        NSLayoutConstraint.activate([
            trendingImageView.leadingAnchor.constraint(equalTo: title.trailingAnchor, constant: CellLayoutOptions .imageHorizontalPadding),
            trendingImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -CellLayoutOptions .imageHorizontalPadding),
            trendingImageView.centerYAnchor.constraint(equalTo: title.centerYAnchor)
        ])

        NSLayoutConstraint.activate([
            casesCountLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: CellLayoutOptions .casesCountLabelHorizontalPadding),
             casesCountLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -CellLayoutOptions .casesCountLabelHorizontalPadding),
             casesCountLabel.topAnchor.constraint(equalTo: title.bottomAnchor, constant: CellLayoutOptions .casesCountLabelHorizontalPadding)
        ])
    }
}

// MARK: - Helpers
extension GlobalSummaryCollectionViewCell {
    func getImageForTrending(trending: Trending) -> UIImage {
        switch trending {
        case .up:
            if let image = UIImage(named: CellOptions.trendingUpImageName) {
                return image
            }
        case .down:
            if let image = UIImage(named: CellOptions.trendingDownImageName) {
                return image
            }
        }
        return UIImage()
    }
}

