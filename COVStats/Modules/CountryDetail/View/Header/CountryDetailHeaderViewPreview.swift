//
//  CountryDetailHeaderViewPreview.swift
//  COVStats
//
//  Created by Igor Podolskiy on 01.10.2020.
//  Copyright © 2020 Igor Podolskiy. All rights reserved.
//

import Foundation

#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct CountryDetailHeaderViewPreview: PreviewProvider {
    static var previews: some View {
        let viewController =  mockViewController()
        viewController.toPreview()
    }

}

fileprivate class mockViewController: UIViewController {

    private let header: CountryDetailHeaderView = {
        let view = CountryDetailHeaderView()
        view.configure(flagImageData: UIImage(named: "esFlag") ?? UIImage(),
                       countryName: "Spain",
                       casesCountText: "345,234",
                       todayCasesCountText: "1341 infected cases reported",
                       deathCountText: "23561",
                       todayDeathCountText: "510 Death cases reported")
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(header)
        setupLayouts()
    }

    private func setupLayouts() {
        header.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            header.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 10),
            header.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,constant: -10),
            header.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10),
            header.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10)
        ])
    }
}
#endif

