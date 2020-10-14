//
//  EducationSegmentsContainerView.swift
//  COVStats
//
//  Created by Igor Podolskiy on 15.10.2020.
//  Copyright © 2020 Igor Podolskiy. All rights reserved.
//

import UIKit

class EducationSegmentsContainerView: UIView {

    let prevention = EducationSegmentPreventionView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupLayouts()
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        addSubview(prevention)
        prevention.setupTabs(viewModels: [EducationSegmentPreventionViewTabViewModel(imageName: EducationBodySegments.Prevention.cleanHands.imageName,
                                                                                     titleText: EducationBodySegments.Prevention.cleanHands.titleText,
                                                                                     tabText: EducationBodySegments.Prevention.cleanHands.tabText),
                                          EducationSegmentPreventionViewTabViewModel(imageName: EducationBodySegments.Prevention.cleanHands.imageName,
                                                                                                                       titleText: EducationBodySegments.Prevention.cleanHands.titleText,
                                                                                                                       tabText: EducationBodySegments.Prevention.cleanHands.tabText)])

    }

    private func setupLayouts() {
        prevention.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            prevention.trailingAnchor.constraint(equalTo: trailingAnchor),
            prevention.leadingAnchor.constraint(equalTo: leadingAnchor),
            prevention.topAnchor.constraint(equalTo: topAnchor),
            prevention.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

}


