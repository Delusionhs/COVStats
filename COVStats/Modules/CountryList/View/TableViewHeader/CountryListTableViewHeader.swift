//
//  CountryListTableViewHeader.swift
//  COVStats
//
//  Created by Igor Podolskiy on 28.09.2020.
//  Copyright © 2020 Igor Podolskiy. All rights reserved.
//

import Foundation
import UIKit

class CountryListTableViewHeader: UIView {

    private enum ViewLayoutOption {
        static let titleTopPadding: CGFloat = 27
        static let titleLeading: CGFloat = 17
        static let subtitleTopPadding: CGFloat = 5
        static let subTitleLeading: CGFloat = 16
    }

    private enum ViewOption {
        static let titleFontSize: CGFloat = 17
        static let subTitleFontSize: CGFloat = 13
    }

    private let title : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: ViewOption.titleFontSize, weight: UIFont.Weight.semibold)
        return label
    }()

    private let subTitle : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: ViewOption.subTitleFontSize)
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupLayouts()
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        self.addSubview(title)
        self.addSubview(subTitle)
    }

    private func setupLayouts() {
        title.translatesAutoresizingMaskIntoConstraints = false
        subTitle.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: self.topAnchor, constant: ViewLayoutOption.titleTopPadding),
            title.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: ViewLayoutOption.titleLeading),
            title.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -ViewLayoutOption.titleLeading)
        ])

        NSLayoutConstraint.activate([
            subTitle.topAnchor.constraint(equalTo: title.bottomAnchor, constant: ViewLayoutOption.subtitleTopPadding),
            subTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: ViewLayoutOption.subTitleLeading),
            subTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -ViewLayoutOption.subTitleLeading),
            subTitle.bottomAnchor.constraint(lessThanOrEqualTo: self.bottomAnchor)
        ])
    }

    func configure(title: String, subTitle: String) {
        self.title.text = title
        self.subTitle.text = subTitle
    }

}


#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct CountryListTableViewHeaderPreview: PreviewProvider {
    static var previews: some View {
        let viewController =  mockViewController()
        viewController.toPreview()
    }

}

fileprivate class mockViewController: UIViewController {

    private let header: CountryListTableViewHeader = {
        let view = CountryListTableViewHeader()
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(header)
        setupLayouts()
        header.configure(title: "Live Reports", subTitle: "Top five Countries")

    }

    private func setupLayouts() {
        header.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            header.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            header.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            header.leftAnchor.constraint(equalTo: view.leftAnchor),
            header.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
    }
}
#endif
