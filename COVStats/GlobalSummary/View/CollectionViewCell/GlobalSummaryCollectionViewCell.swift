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

    private enum CellLayoutOption {
        static let titleVerticalPadding: CGFloat = 28
        static let titleHorizontalPadding: CGFloat = 10
        static let imageHorizontalPadding: CGFloat = 10
        static let casesCountLabelHorizontalPadding: CGFloat = 10
        static let casesCountLabelVerticalPadding: CGFloat = 10
        static let trendingGraphHorizontalPadding: CGFloat = 16
        static let trendingGraphTopPadding: CGFloat = 24
        static let trendingGraphBottomPadding: CGFloat = 38
    }

    private enum CellOption {
        static let labelTextNumberOfLines = 1
        static let titleFontSize:CGFloat = 17
        static let casesCountLabelFontSize: CGFloat = 24
        static let layerBorderWidth: CGFloat = 1
        static let layerCornerRadius: CGFloat = 10
        static let trendingUpImageName = "trendingUpRed"
        static let trendingDownImageName = "trendingUpGreen"
        static let layerBorderColor: CGColor = UIColor(hex: "#E4E4E4", alpha: 0.6).cgColor
        static let defaultGreenColorShade: UIColor = UIColor(hex: "#00C48C")
        static let defaultRedColorShade: UIColor = UIColor(hex: "#FF647C")
    }

    private let trendingImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    private let title: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: CellOption.titleFontSize, weight: UIFont.Weight.regular)
        label.numberOfLines = CellOption.labelTextNumberOfLines
        return label
    }()

    private let casesCountLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: CellOption.casesCountLabelFontSize, weight: UIFont.Weight.semibold)
        label.numberOfLines = CellOption.labelTextNumberOfLines
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

    func configureForType(type: GlobalSummaryCollectionViewCellType) {
        title.text = type.rawValue
        switch type {
        case .totalCases:
            trendingImageView.image = getImageForTrending(trending: .up)
            casesCountLabel.textColor = .black
        case .totalRecovered:
            trendingImageView.image = getImageForTrending(trending: .down)
            casesCountLabel.textColor = CellOption.defaultGreenColorShade

        case .activeCases:
            trendingImageView.image = getImageForTrending(trending: .up)
            casesCountLabel.textColor = .black
        case .totatDeath:
            trendingImageView.image = getImageForTrending(trending: .up)
            casesCountLabel.textColor = CellOption.defaultRedColorShade
        }
    }

    func configure(viewModel: GlobalSummaryCollectionViewCellViewModel) {
        title.text = viewModel.type.rawValue
        casesCountLabel.text = viewModel.casesCountText
    }

    private func setupViews() {
        addSubview(casesCountLabel)
        addSubview(title)
        addSubview(trendingImageView)
        addSubview(trendingGraph)
        setupBorder()
        setupGraph()
    }

    private func setupBorder() {
        contentView.layer.borderWidth = CellOption.layerBorderWidth
        contentView.layer.cornerRadius = CellOption.layerCornerRadius
        contentView.layer.borderColor = CellOption.layerBorderColor
    }

    private func setupGraph() {
        trendingGraph.xAxis.drawGridLinesEnabled = false
        trendingGraph.xAxis.drawAxisLineEnabled = false
        trendingGraph.xAxis.drawLabelsEnabled = false
        trendingGraph.legend.enabled = false
        trendingGraph.rightAxis.enabled = false
        trendingGraph.leftAxis.enabled = false
    }

    func setTrendingGraphData(xAxisData: [Int], yAxisData: [Int]) {
        
        var lineDataEntry: [ChartDataEntry] = []

        for i in 0..<min(xAxisData.count, yAxisData.count) {
            lineDataEntry.append(ChartDataEntry(x: Double(xAxisData[i]), y: Double(yAxisData[i])))
        }

        let lineDataSet = LineChartDataSet(entries: lineDataEntry, label: "Cases")
        let lineData = LineChartData()
        lineData.addDataSet(lineDataSet)
        lineData.setDrawValues(false)
        lineDataSet.mode = .cubicBezier
        lineDataSet.colors = [CellOption.defaultRedColorShade]
        lineDataSet.drawCirclesEnabled = false
        trendingGraph.data = lineData
    }

    private func setupLayouts() {
        title.translatesAutoresizingMaskIntoConstraints = false
        trendingImageView.translatesAutoresizingMaskIntoConstraints = false
        casesCountLabel.translatesAutoresizingMaskIntoConstraints = false
        trendingGraph.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            title.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: CellLayoutOption .titleHorizontalPadding),
            title.topAnchor.constraint(equalTo: contentView.topAnchor, constant: CellLayoutOption.titleVerticalPadding)
        ])

        NSLayoutConstraint.activate([
            trendingImageView.leadingAnchor.constraint(equalTo: title.trailingAnchor, constant: CellLayoutOption .imageHorizontalPadding),
            trendingImageView.trailingAnchor.constraint(lessThanOrEqualTo: contentView.trailingAnchor, constant: -CellLayoutOption .imageHorizontalPadding),

            trendingImageView.centerYAnchor.constraint(equalTo: title.centerYAnchor)
        ])

        NSLayoutConstraint.activate([
            casesCountLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: CellLayoutOption .casesCountLabelHorizontalPadding),
            casesCountLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -CellLayoutOption .casesCountLabelHorizontalPadding),
            casesCountLabel.topAnchor.constraint(equalTo: title.bottomAnchor, constant: CellLayoutOption .casesCountLabelHorizontalPadding)
        ])

        NSLayoutConstraint.activate([
            trendingGraph.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: CellLayoutOption .trendingGraphHorizontalPadding),
            trendingGraph.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -CellLayoutOption .trendingGraphHorizontalPadding),
            trendingGraph.topAnchor.constraint(equalTo: casesCountLabel.bottomAnchor, constant: CellLayoutOption.trendingGraphTopPadding),
            trendingGraph.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -CellLayoutOption.trendingGraphBottomPadding)
        ])
    }
}

// MARK: - Helpers
extension GlobalSummaryCollectionViewCell {
    func getImageForTrending(trending: Trending) -> UIImage {
        switch trending {
        case .up:
            if let image = UIImage(named: CellOption.trendingUpImageName) {
                return image
            }
        case .down:
            if let image = UIImage(named: CellOption.trendingDownImageName) {
                return image
            }
        }
        return UIImage()
    }
}

extension GlobalSummaryCollectionViewCell {
    static var identifier: String {
        return String(describing: self)
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

    private enum CellOption {
        static let cellHeight: CGFloat = 208.0
        static let cellWidth: CGFloat = 157.0
        static let trendingX = [1,2,3,4,5,6,7,8,9,10]
        static let trendingY = [76,150,180,180,195,195,190,164,136,120]
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
        cell.configure(viewModel: GlobalSummaryCollectionViewCellViewModel(type: .activeCases, casesCountText: "356,014,000,0"))
        cell.setTrendingGraphData(xAxisData: CellOption.trendingX, yAxisData: CellOption.trendingY )
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(width: CellOption.cellWidth, height: CellOption.cellHeight)
    }

}
#endif

