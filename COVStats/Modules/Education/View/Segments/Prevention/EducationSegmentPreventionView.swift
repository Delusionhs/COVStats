//
//  EducationBodyView.swift
//  COVStats
//
//  Created by Igor Podolskiy on 12.10.2020.
//  Copyright © 2020 Igor Podolskiy. All rights reserved.
//

import Foundation
import UIKit

class EducationSegmentPreventionView: UIView {

    let tab = EducationSegmentPreventionViewTab()

    private enum Localization {
    }

    private enum ViewOptions {
    }

    private enum LayoutOptions {
        static let segmentedControlBarHeight:CGFloat = 5
    }

    let segmentedControl = UISegmentedControl()
    private let segmentedControlBar = UIView()
    private let segmentedControlSelectedBar = UIView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupTabs()
        setupLayouts()

    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
    }

    private func setupTabs() {
        tab.configure(viewModel: EducationSegmentPreventionViewTabViewModel(imageName: "preventionFace", titleText: "Clean your hands often",
                                                            tabText: "Wash hands often with soap and water for at least 20s"))
        addSubview(tab)
    }

    private func setupLayouts() {
        tab.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            tab.leadingAnchor.constraint(equalTo: leadingAnchor),
            tab.topAnchor.constraint(equalTo: topAnchor),
            tab.trailingAnchor.constraint(equalTo: trailingAnchor),
            tab.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}



