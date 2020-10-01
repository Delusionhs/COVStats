//
//  CountryDetailGraphViewPreview.swift
//  COVStats
//
//  Created by Igor Podolskiy on 01.10.2020.
//  Copyright © 2020 Igor Podolskiy. All rights reserved.
//
import Foundation

#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct CountryDetailGraphViewPreview: PreviewProvider {
    static var previews: some View {
        let viewController =  mockViewController()
        viewController.toPreview()
    }

}

fileprivate class mockViewController: UIViewController {

    private let header: CountryDetailGraphView = {
        let view = CountryDetailGraphView()
        view.configureTrendingGraph(xAxisData: [1,2,3,4,5], yAxisData: [1000,1100,1250,800,500])
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
            header.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,constant: -500),
            header.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10),
            header.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10)
        ])
    }
}
#endif
