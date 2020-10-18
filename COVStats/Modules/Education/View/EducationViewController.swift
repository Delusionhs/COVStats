//
//  EducationEducationViewController.swift
//  COVStats
//
//  Created by Igor Podolsiy on 07/10/2020.
//  Copyright © 2020 Igor Podolskiy. All rights reserved.
//

import UIKit

class EducationViewController: UIViewController{

    private enum Localization {
        static let preventionSegmentTitle = "Prevention"
        static let symptomsSegmentTitle = "Symptoms"
        static let diagnosisSegmentTitle = "Diagnosis"
    }

    private enum SegmentedControlOptions {
        static let titleTextSize: CGFloat = 13
        static let normalTitleTextColor = UIColor(hex: "#999999")
        static let segmentedControlBarColor = UIColor(hex: "#96FFE1")
        static let segmentedControlSelectedBarColor = UIColor(hex: "#00C48C")
        static let barAnimationDuratation = 0.3
    }

    private enum ViewOptions {
    }

    private enum LayoutOptions {
        static let segmentedControlBarHeight: CGFloat = 5
        static let segmentedControlTopMargin: CGFloat = 60
        static let segmentsContainerTopMargin: CGFloat = 35
        static let preventionScreenHeight: CGFloat = 1150
        static let symptomsScreenHeight: CGFloat = 1250
        static let diagnosisScreenHeight: CGFloat = 1000
        static let startHeight: CGFloat = 600

    }

    var output: EducationViewOutput!

    private let headerView = EducationHeaderView()
    private let segmentedControl = UISegmentedControl()
    private let segmentedControlBar = UIView()
    private let segmentedControlSelectedBar = UIView()
    private let scrollView = UIScrollView()
    private let scrollViewContentView = UIView()

    private let segmentsContainer = EducationSegmentsContainerView()
    

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
        headerView.delegate = self
        setupViews()
        setupSegmentedControl()
        setupLayouts()
    }

    private func setupViews() {
        view.backgroundColor = .white
        view.addSubview(scrollView)
        scrollView.addSubview(scrollViewContentView)
        scrollViewContentView.addSubview(headerView)
        scrollViewContentView.addSubview(segmentsContainer)
        segmentsContainer.configurePreventionTabs(viewModel: output.viewModelsForPreventionsSegments())
        segmentsContainer.configureSymptomsTabs(viewModel: output.viewModelsForSymptomsSegments())
        segmentsContainer.configureDiagnosisDelegate(delegate: self)
    }

    private func setupSegmentedControl() {
        segmentedControl.insertSegment(withTitle: Localization.preventionSegmentTitle, at: 0, animated: true)
        segmentedControl.insertSegment(withTitle: Localization.symptomsSegmentTitle, at: 1, animated: true)
        segmentedControl.insertSegment(withTitle: Localization.diagnosisSegmentTitle, at: 2, animated: true)

        segmentedControl.backgroundColor = .clear
        segmentedControl.selectedSegmentTintColor = .clear
        
        scrollViewContentView.addSubview(segmentedControl)
        scrollViewContentView.addSubview(segmentedControlBar)
        scrollViewContentView.addSubview(segmentedControlSelectedBar)
        
        segmentedControl.setTitleTextAttributes([NSAttributedString.Key.font : UIFont.systemFont(ofSize: SegmentedControlOptions.titleTextSize,
                                                                                                 weight: UIFont.Weight.regular),
                                                 NSAttributedString.Key.foregroundColor: SegmentedControlOptions.normalTitleTextColor],
                                                for: .normal)
        segmentedControl.setTitleTextAttributes([NSAttributedString.Key.font : UIFont.systemFont(ofSize: SegmentedControlOptions.titleTextSize,
                                                                                                 weight: UIFont.Weight.regular),
                                                 NSAttributedString.Key.foregroundColor: UIColor.black],
                                                for: .selected)
        segmentedControl.selectedSegmentIndex = 0
        segmentedControlBar.backgroundColor = SegmentedControlOptions.segmentedControlBarColor
        segmentedControlSelectedBar.backgroundColor = SegmentedControlOptions.segmentedControlSelectedBarColor

        for i in 0...(segmentedControl.numberOfSegments-1)  {
            let backgroundSegmentView = segmentedControl.subviews[i]
            backgroundSegmentView.isHidden = true
        }

        segmentedControl.addTarget(self, action: #selector(segmentedControlValueChanged), for: UIControl.Event.valueChanged)
    }

    private func setupLayouts() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollViewContentView.translatesAutoresizingMaskIntoConstraints = false
        headerView.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControlBar.translatesAutoresizingMaskIntoConstraints = false
        segmentedControlSelectedBar.translatesAutoresizingMaskIntoConstraints = false
        segmentsContainer.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])

        NSLayoutConstraint.activate([
            scrollViewContentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollViewContentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollViewContentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            scrollViewContentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
        ])

        NSLayoutConstraint.activate([
            headerView.leadingAnchor.constraint(equalTo: scrollViewContentView.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: scrollViewContentView.trailingAnchor),
            headerView.topAnchor.constraint(equalTo: scrollViewContentView.topAnchor),
        ])

        NSLayoutConstraint.activate([
            segmentedControl.leadingAnchor.constraint(equalTo: scrollViewContentView.leadingAnchor),
            segmentedControl.trailingAnchor.constraint(equalTo: scrollViewContentView.trailingAnchor),
            segmentedControl.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: LayoutOptions.segmentedControlTopMargin),
        ])

        NSLayoutConstraint.activate([
            segmentedControlBar.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor),
            segmentedControlBar.widthAnchor.constraint(equalTo: segmentedControl.widthAnchor),
            segmentedControlBar.heightAnchor.constraint(equalToConstant: LayoutOptions.segmentedControlBarHeight)
        ])

        NSLayoutConstraint.activate([
            segmentedControlSelectedBar.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor),
            segmentedControlSelectedBar.widthAnchor.constraint(equalTo: segmentedControl.widthAnchor, multiplier: 1 / CGFloat(segmentedControl.numberOfSegments)),
            segmentedControlSelectedBar.leftAnchor.constraint(equalTo: segmentedControl.leftAnchor),
            segmentedControlSelectedBar.heightAnchor.constraint(equalToConstant: LayoutOptions.segmentedControlBarHeight)
        ])

        NSLayoutConstraint.activate([
            segmentsContainer.topAnchor.constraint(equalTo: segmentedControlBar.bottomAnchor, constant: LayoutOptions.segmentsContainerTopMargin),
            segmentsContainer.widthAnchor.constraint(equalTo: segmentedControl.widthAnchor),
            segmentsContainer.leftAnchor.constraint(equalTo: segmentedControl.leftAnchor),
            segmentsContainer.bottomAnchor.constraint(equalTo: scrollViewContentView.bottomAnchor),
            segmentsContainer.heightAnchor.constraint(equalToConstant: LayoutOptions.startHeight)
        ])
    }

    @objc func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        UIView.animate(withDuration: SegmentedControlOptions.barAnimationDuratation) {
            self.segmentedControlSelectedBar.frame.origin.x = (self.segmentedControl.frame.width / CGFloat(self.segmentedControl.numberOfSegments)) * CGFloat(self.segmentedControl.selectedSegmentIndex)
        }
        output.segmentedControlChangeIndex(index: segmentedControl.selectedSegmentIndex)

        switch sender.selectedSegmentIndex {
        case 0:
            scrollView.frame = CGRect(x: view.frame.origin.x, y: view.frame.origin.y, width: view.frame.width, height: LayoutOptions.preventionScreenHeight)
            scrollView.contentSize = CGSize(width: view.frame.width, height: LayoutOptions.preventionScreenHeight)
        case 1:
            scrollView.frame = CGRect(x: view.frame.origin.x, y: view.frame.origin.y, width: view.frame.width, height: LayoutOptions.symptomsScreenHeight)
            scrollView.contentSize = CGSize(width: view.frame.width, height: LayoutOptions.symptomsScreenHeight)
        case 2:
            scrollView.frame = CGRect(x: view.frame.origin.x, y: view.frame.origin.y, width: view.frame.width, height: LayoutOptions.diagnosisScreenHeight)
            scrollView.contentSize = CGSize(width: view.frame.width, height: LayoutOptions.diagnosisScreenHeight)
        default:
            return
        }
    }
}

extension EducationViewController: EducationViewInput {
    func changeSegmentsContainerSegment(segment: EducationSegments) {
        segmentsContainer.changeSegment(segment: segment)
    }

}

extension EducationViewController: EducationHeaderViewButtonDelegate {
    func seeMoreButtonTap() {
        output.seeMoreButtonPressed()
    }
}

extension EducationViewController: EducationSegmentDiagnosisViewButtonDelegate{
    func reportButtonTap() {
        output.reportButtonPressed()
    }
}
