//
//  GlobalSummaryRecoveryGraphPreview.swift
//  COVStats
//
//  Created by Igor Podolskiy on 02.10.2020.
//  Copyright © 2020 Igor Podolskiy. All rights reserved.
//

import Foundation

#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct GlobalSummaryRecoveryGraphPreview: PreviewProvider {
    static var previews: some View {
        let viewController =  mockViewController()
        viewController.toPreview()
    }

}

fileprivate class mockViewController: UIViewController {

    private let header: GlobalSummaryRecoveryGraph = {
        let view = GlobalSummaryRecoveryGraph()
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(header)
        setupLayouts()

    }

    override func viewDidLayoutSubviews() {
        header.configure(affected: 338225, recovered: 96958)
    }

    private func setupLayouts() {
        header.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            header.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 0),
            header.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,constant: 0),
            header.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
            header.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0)
        ])
    }
}
#endif


