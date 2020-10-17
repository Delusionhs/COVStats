//
//  CountryDetailGraphView.swift
//  COVStats
//
//  Created by Igor Podolskiy on 01.10.2020.
//  Copyright © 2020 Igor Podolskiy. All rights reserved.
//

import UIKit
import Charts

class CountryDetailGraphView: UIView {

    private enum ViewOptions {
        static let layerBorderWidth: CGFloat = 1
        static let layerBorderCornerRadius: CGFloat = 10
        static let layerBorderColor: CGColor = UIColor(hex: "#E4E4E4", alpha: 0.6).cgColor
        static let titleFontSize: CGFloat = 15
        static let titleText = "Affected and death daily changes"
    }

    private enum GraphOptions {
        static let gradientColorLocation: [CGFloat] = [0.0,1.0]
        static let gradientFillAlpha: CGFloat = 0.9
        static let gradientAngle: CGFloat = -30
        static let casesGradientStartColor = UIColor(hex: "#00C48C")
        static let casesGradientEndColor = UIColor(hex: "#96FFE1")
        static let deathGradientStatColor = UIColor(hex: "#FF647C")
        static let deathGradientEndColor = UIColor(hex: "#FFCBD3")
        static let deathDataSetLabel = "Death"
        static let casesDataSetLabel = "Affected"
        static let graphGridColor = UIColor(hex: "#E4E4E4")
    }

    private enum LayoutOptions {
        static let titleMargin: CGFloat = 15
    }

    private let trendingGraph: LineChartView = {
        let lineChartView = LineChartView()
        return lineChartView
    }()

    private let trendingGraphTitle: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: ViewOptions.titleFontSize, weight: UIFont.Weight.semibold)
        label.text = ViewOptions.titleText
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
        addSubview(trendingGraph)
        addSubview(trendingGraphTitle)
        setupGraph()
    }

    private func setupGraph() {
        trendingGraph.isUserInteractionEnabled = false
        trendingGraph.xAxis.drawGridLinesEnabled = true
        trendingGraph.xAxis.gridColor = GraphOptions.graphGridColor
        trendingGraph.xAxis.drawAxisLineEnabled = false

        trendingGraph.rightAxis.enabled = false
        trendingGraph.leftAxis.enabled = false
        trendingGraph.legend.enabled = false
        trendingGraph.minOffset = 0
        trendingGraph.leftAxis.axisMinimum = 0

        trendingGraph.xAxis.drawLabelsEnabled = true
        trendingGraph.xAxis.labelPosition = XAxis.LabelPosition.bottom
        trendingGraph.xAxis.valueFormatter = DayAxisValueFormatter(chart: trendingGraph)
    }
    

    private func setupLayouts() {
        trendingGraph.translatesAutoresizingMaskIntoConstraints = false
        trendingGraphTitle.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            trendingGraphTitle.topAnchor.constraint(equalTo: self.topAnchor, constant: LayoutOptions.titleMargin),
            trendingGraphTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: LayoutOptions.titleMargin),
            trendingGraphTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -LayoutOptions.titleMargin)
        ])

        NSLayoutConstraint.activate([
            trendingGraph.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            trendingGraph.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            trendingGraph.topAnchor.constraint(equalTo: trendingGraphTitle.bottomAnchor),
            trendingGraph.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }

    private func setupBorder() {
        layer.borderWidth = ViewOptions.layerBorderWidth
        layer.cornerRadius = ViewOptions.layerBorderCornerRadius
        layer.borderColor = ViewOptions.layerBorderColor
    }

    private func configureWithData(xAxisData: [Int], affectedYAxisData: [Int], deathYAxisData: [Int]) {

        var deathLineDataEntry: [ChartDataEntry] = []
        var affectedLineDataEntry: [ChartDataEntry] = []

        var affectedMaxLineDataEntry: [ChartDataEntry] = []
        var deathMaxLineDataEntry: [ChartDataEntry] = []


        for i in 0..<min(xAxisData.count, deathYAxisData.count) {
            deathLineDataEntry.append(ChartDataEntry(x: Double(xAxisData[i]), y: Double(deathYAxisData[i])))
        }

        for i in 0..<min(xAxisData.count, affectedYAxisData.count) {
            affectedLineDataEntry.append(ChartDataEntry(x: Double(xAxisData[i]), y: Double(affectedYAxisData[i])))
        }

        affectedMaxLineDataEntry.append(ChartDataEntry(x: Double(affectedYAxisData.lastIndex(where: {$0 == affectedYAxisData.max()}) ?? 0)+1,
                                                       y: Double(affectedYAxisData.last(where: {$0 == affectedYAxisData.max()}) ?? 0)))

        deathMaxLineDataEntry.append(ChartDataEntry(x: Double(deathYAxisData.lastIndex(where: {$0 == deathYAxisData.max()}) ?? 0)+1,
                                                       y: Double(deathYAxisData.last(where: {$0 == deathYAxisData.max()}) ?? 0)))

        let deathLineDataSet = LineChartDataSet(entries: deathLineDataEntry, label: GraphOptions.deathDataSetLabel)
        let affectedLineDataSet = LineChartDataSet(entries: affectedLineDataEntry, label: GraphOptions.casesDataSetLabel)

        let deathMaxLineDataSet = LineChartDataSet(entries: deathMaxLineDataEntry)
        let affectedMaxLineDataSet = LineChartDataSet(entries:  affectedMaxLineDataEntry)

        let lineData = LineChartData()

        deathLineDataSet.mode = .cubicBezier
        deathLineDataSet.colors = [UIColor.clear]
        deathLineDataSet.drawCirclesEnabled = false
        deathLineDataSet.drawValuesEnabled = false
        affectedLineDataSet.mode = .cubicBezier
        affectedLineDataSet.drawValuesEnabled = false
        affectedLineDataSet.colors = [UIColor.clear]
        affectedLineDataSet.drawCirclesEnabled = false

        affectedMaxLineDataSet.circleColors = [UIColor.white]
        affectedMaxLineDataSet.circleHoleColor = GraphOptions.casesGradientEndColor

        deathMaxLineDataSet.circleColors = [UIColor.white]
        deathMaxLineDataSet.circleHoleColor = GraphOptions.deathGradientEndColor


        if let gradient = getGradient(fromColor: GraphOptions.casesGradientStartColor, toColor: GraphOptions.casesGradientEndColor, location: GraphOptions.gradientColorLocation) {
            affectedLineDataSet.fill = Fill.fillWithLinearGradient(gradient, angle: GraphOptions.gradientAngle)
            affectedLineDataSet.drawFilledEnabled = true
        }
        if let gradient = getGradient(fromColor: GraphOptions.deathGradientStatColor, toColor: GraphOptions.deathGradientEndColor, location: GraphOptions.gradientColorLocation) {
            deathLineDataSet.fill = Fill.fillWithLinearGradient(gradient, angle: GraphOptions.gradientAngle)
            deathLineDataSet.drawFilledEnabled = true
        }
        affectedLineDataSet.fillAlpha = GraphOptions.gradientFillAlpha
        deathLineDataSet.fillAlpha = GraphOptions.gradientFillAlpha
        lineData.addDataSet(affectedLineDataSet)
        lineData.addDataSet(deathLineDataSet)
        lineData.addDataSet(affectedMaxLineDataSet)
        lineData.addDataSet(deathMaxLineDataSet)
        trendingGraph.data = lineData
        trendingGraph.maxVisibleCount = Int(Int32.max)
    }

    func configure(with viewModel: CountryDetailGraphViewModel) {
        configureWithData(xAxisData: viewModel.xAxisData, affectedYAxisData: viewModel.affectedYAxisData, deathYAxisData: viewModel.deathYAxisData)
    }


}

//MARK: - Helpers
extension CountryDetailGraphView {
    private func getGradient(fromColor: UIColor, toColor: UIColor, location: [CGFloat]) -> CGGradient? {
        let gradientColors = [fromColor.cgColor, toColor.cgColor] as CFArray
        if let gradient = CGGradient.init(colorsSpace: CGColorSpaceCreateDeviceRGB(), colors: gradientColors, locations: location) {
            return gradient
        }
        return nil
    }
}

