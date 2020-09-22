//
//  GlobalSummaryCollectionViewCell.swift
//  COVStats
//
//  Created by Igor Podolskiy on 22.09.2020.
//  Copyright © 2020 Igor Podolskiy. All rights reserved.
//

import Foundation
import UIKit
import Charts

final class GlobalSummaryCollectionViewCell: UICollectionViewCell {

    private enum CellLayoutOptions {
        static let titleVerticalPadding: CGFloat = 28
        static let titleHorizontalPadding: CGFloat = 10
        static let imageHorizontalPadding: CGFloat = 10
        static let casesCountLabelHorizontalPadding: CGFloat = 10
        static let casesCountLabelVerticalPadding: CGFloat = 10
        static let trendingGraphHorizontalPadding: CGFloat = 16
        static let trendingGraphTopPadding: CGFloat = 24
        static let trendingGraphBottomPadding: CGFloat = 38
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

    private let trendingGraph: LineChartView = {
        let lineChartView = LineChartView()
        return lineChartView
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

    func setup(title: String, countText: String, trending: Trending) {
        self.title.text = title
        self.casesCountLabel.text = countText
        self.trendingImageView.image = getImageForTrending(trending: trending)
    }

    private func setupViews() {
        addSubview(casesCountLabel)
        addSubview(title)
        addSubview(trendingImageView)
        addSubview(trendingGraph)
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
        trendingGraph.translatesAutoresizingMaskIntoConstraints = false

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

        NSLayoutConstraint.activate([
            trendingGraph.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: CellLayoutOptions .trendingGraphHorizontalPadding),
            trendingGraph.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -CellLayoutOptions .trendingGraphHorizontalPadding),
            trendingGraph.topAnchor.constraint(equalTo: casesCountLabel.bottomAnchor, constant: CellLayoutOptions.trendingGraphTopPadding),
            trendingGraph.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -CellLayoutOptions.trendingGraphBottomPadding)
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

// MARK: - Preview

#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct GlobalSummaryCollectionViewCellPreview: PreviewProvider {
    static var previews: some View {
        let viewController =  mockViewController()
        viewController.toPreview()
    }

}

fileprivate class mockViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout  {

    private enum CellOptions {
        static let cellHeight: CGFloat = 208.0
        static let cellWidth: CGFloat = 157.0
    }

    private let collectionView: UICollectionView = {
        let viewLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: viewLayout)
        collectionView.backgroundColor = .white
        return collectionView
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(GlobalSummaryCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        view.addSubview(collectionView)
        setupLayouts()

    }

    private func setupLayouts() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            collectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! GlobalSummaryCollectionViewCell
        cell.setup(title: "Total Cases", countText: "360,524", trending: .up)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(width: CellOptions.cellWidth, height: CellOptions.cellHeight)
    }

}
#endif

