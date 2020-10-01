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
        static let layerBorderColor: CGColor = UIColor(hex: "#999999", alpha: 0.6).cgColor
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
//        trendingGraph.isUserInteractionEnabled = false
//        trendingGraph.xAxis.drawGridLinesEnabled = false
//        trendingGraph.xAxis.drawAxisLineEnabled = false
//        trendingGraph.xAxis.drawLabelsEnabled = false
//        trendingGraph.rightAxis.enabled = false
//        trendingGraph.leftAxis.enabled = false
//        trendingGraph.legend.enabled = false
        trendingGraph.minOffset = 0

//        trendingGraph.legend.enabled = true
//        trendingGraph.legend.form = .circle
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

    func configureTrendingGraph(xAxisData: [Int], affectedYAxisData: [Int], deathYAxisData: [Int]) {

        var deathLineDataEntry: [ChartDataEntry] = []
        var affectedLineDataEntry: [ChartDataEntry] = []

        for i in 0..<min(xAxisData.count, deathYAxisData.count) {
            deathLineDataEntry.append(ChartDataEntry(x: Double(xAxisData[i]), y: Double(deathYAxisData[i])))
        }

        for i in 0..<min(xAxisData.count, affectedYAxisData.count) {
            affectedLineDataEntry.append(ChartDataEntry(x: Double(xAxisData[i]), y: Double(affectedYAxisData[i])))
        }

        let deathLineDataSet = LineChartDataSet(entries: deathLineDataEntry, label: GraphOptions.deathDataSetLabel)
        let affectedLineDataSet = LineChartDataSet(entries: affectedLineDataEntry, label: GraphOptions.casesDataSetLabel)
        let lineData = LineChartData()
        lineData.setDrawValues(false)
        deathLineDataSet.mode = .cubicBezier
        deathLineDataSet.drawCirclesEnabled = false
        deathLineDataSet.colors = [UIColor.clear]
        affectedLineDataSet.mode = .cubicBezier
        affectedLineDataSet.drawCirclesEnabled = false
        affectedLineDataSet.colors = [UIColor.clear]

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
        lineData.setDrawValues(false)
        trendingGraph.data = lineData
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
