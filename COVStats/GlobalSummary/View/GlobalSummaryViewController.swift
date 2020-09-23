//
//  GlobalSummaryViewConroller.swift
//  COVStats
//
//  Created by Igor Podolskiy on 21.09.2020.
//  Copyright © 2020 Igor Podolskiy. All rights reserved.
//

import Foundation
import UIKit

class GlobalSummaryViewController: UIViewController{

    private enum CollectionOption {
        static let collectionViewCellCount = GlobalSummaryCollectionViewCellType.allCases.count
    }

    var output: GlobalSummaryViewOutput!

    private let configurator: GlobalSummaryConfiguratorProtocol = GlobalSummaryConfigurator()

    private let collectionView: UICollectionView = {
        let viewLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: viewLayout)
        collectionView.backgroundColor = .white
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(with: self)
        output.viewIsReady()
        setupCollectionView()
        setupLayouts()
    }

    private func setupCollectionView() {
        view.addSubview(collectionView)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(GlobalSummaryCollectionViewCell.self, forCellWithReuseIdentifier: GlobalSummaryCollectionViewCell.identifier)
        
    }
    private func setupLayouts() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            collectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
    }


}

//MARK: -  GlobalSummaryViewInput

extension GlobalSummaryViewController: GlobalSummaryViewInput {
    func reloadCollectionViewData() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
}

// MARK: - UICollectionViewDelegate & DataSource

extension GlobalSummaryViewController: UICollectionViewDelegate {

}

extension GlobalSummaryViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        CollectionOption.collectionViewCellCount
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GlobalSummaryCollectionViewCell.identifier, for: indexPath) as! GlobalSummaryCollectionViewCell
        if let CellViewModel = output.cellViewModel(for: indexPath) {
            cell.configure(viewModel: CellViewModel)
        }
        return cell
    }
}

extension GlobalSummaryViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 157.0, height: 208.0)
    }

}

// MARK: - Preview

#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct GlobalSummaryViewControllerPreview: PreviewProvider {

    static var previews: some View {
        GlobalSummaryViewController().toPreview()
    }
}
#endif
