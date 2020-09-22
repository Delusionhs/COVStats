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

    enum Trending {
        case up
        case down
    }

    private enum CellOptions {
        static let labelTextNumberOfLines = 1
        static let layerBorderWidth: CGFloat = 1
        static let layerCornerRadius: CGFloat = 10
        static let trendingUpImageName = "trending-up"
        static let trendingDownImageName = "trending-down"
    }

    private let trendingImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    private let title: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = CellOptions.labelTextNumberOfLines
        return label
    }()

    private let casesCountLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
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
        trendingImageView.image = UIImage(named: "trending-up")

        setupBorder()

    }

    private func setupBorder() {
        contentView.layer.borderWidth = CellOptions.layerBorderWidth
        contentView.layer.cornerRadius = CellOptions.layerCornerRadius
    }

    private func setupLayouts() {
        title.translatesAutoresizingMaskIntoConstraints = false
        trendingImageView.translatesAutoresizingMaskIntoConstraints = false
        casesCountLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
             trendingImageView.leadingAnchor.constraint(equalTo: title.trailingAnchor, constant: 2.0),
             trendingImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16.0),
             trendingImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16.0)
        ])

        NSLayoutConstraint.activate([
             title.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16.0),
             title.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -40.0),
             title.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16.0)
        ])

        NSLayoutConstraint.activate([
             casesCountLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16.0),
             casesCountLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16.0),
             casesCountLabel.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 16.0)
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

