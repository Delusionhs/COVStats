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
    }

    private enum LayoutOptions {
    }

    private let trendingGraph: LineChartView = {
        let lineChartView = LineChartView()
        return lineChartView
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
        setupGraph()
    }

    private func setupGraph() {
        trendingGraph.isUserInteractionEnabled = false
        trendingGraph.xAxis.drawGridLinesEnabled = false
        trendingGraph.xAxis.drawAxisLineEnabled = false
        trendingGraph.xAxis.drawLabelsEnabled = false
        trendingGraph.legend.enabled = false
        trendingGraph.rightAxis.enabled = false
        trendingGraph.leftAxis.enabled = false
    }
    

    private func setupLayouts() {
        trendingGraph.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            trendingGraph.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            trendingGraph.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            trendingGraph.topAnchor.constraint(equalTo: self.topAnchor),
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

        let deathLineDataSet = LineChartDataSet(entries: deathLineDataEntry, label: "Death")
        let affectedLineDataSet = LineChartDataSet(entries: affectedLineDataEntry, label: "Affected")
        let lineData = LineChartData()
        lineData.setDrawValues(false)
        deathLineDataSet.mode = .cubicBezier
        deathLineDataSet.drawCirclesEnabled = false
        deathLineDataSet.colors = [UIColor.clear]
        affectedLineDataSet.mode = .cubicBezier
        affectedLineDataSet.drawCirclesEnabled = false
        affectedLineDataSet.colors = [UIColor.clear]
        //gradient colors
        let deathGradientColors = [UIColor(hex: "#FF647C").cgColor,UIColor(hex: "#FFCBD3").cgColor] as CFArray
        let affectedGradientColors = [UIColor(hex: "#00C48C").cgColor,UIColor(hex: "#96FFE1").cgColor] as CFArray
        let colorLocation: [CGFloat] = [0.0,1.0]
        if let gradient = CGGradient.init(colorsSpace: CGColorSpaceCreateDeviceRGB(), colors: affectedGradientColors, locations: colorLocation) {
            affectedLineDataSet.fill = Fill.fillWithLinearGradient(gradient, angle: -30)
            affectedLineDataSet.drawFilledEnabled = true
        }
        if let gradient = CGGradient.init(colorsSpace: CGColorSpaceCreateDeviceRGB(), colors: deathGradientColors, locations: colorLocation) {
            deathLineDataSet.fill = Fill.fillWithLinearGradient(gradient, angle: -30)
            deathLineDataSet.drawFilledEnabled = true
        }
        affectedLineDataSet.fillAlpha = 0.9
        deathLineDataSet.fillAlpha = 0.9
        lineData.addDataSet(affectedLineDataSet)
        lineData.addDataSet(deathLineDataSet)
        lineData.setDrawValues(false)
        //
        trendingGraph.data = lineData
    }
}
