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
        static let collectionViewCellOrder: [GlobalSummaryCollectionViewCellType] = [.totalCases,.totalRecovered,.activeCases,.totatDeath]
        static let cellSpacing: CGFloat = 22.0
        static let cellHeight: CGFloat = 208.0
        static let cellInset: CGFloat = 15
    }

    private enum LayoutOptions {
        static let viewSpacing: CGFloat = 25
        static let recoveryGraphMargin: CGFloat = 10
    }

    var output: GlobalSummaryViewOutput!

    private let collectionView: UICollectionView = {
        let viewLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: viewLayout)
        collectionView.backgroundColor = .white
        return collectionView
    }()

    private let recoveryGraph = GlobalSummaryRecoveryGraph()

    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
        setupCollectionView()
        view.addSubview(recoveryGraph)
        setupLayouts()
    }

    private func setupCollectionView() {
        view.addSubview(collectionView)
        view.backgroundColor = .white
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(GlobalSummaryCollectionViewCell.self, forCellWithReuseIdentifier: GlobalSummaryCollectionViewCell.identifier)
    }

    private func setupLayouts() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        recoveryGraph.translatesAutoresizingMaskIntoConstraints = false

        collectionView.contentInset = UIEdgeInsets(top: CollectionOption.cellInset, left: CollectionOption.cellInset,bottom: CollectionOption.cellInset, right: CollectionOption.cellInset)

        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -view.frame.height/2),
            collectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])

        NSLayoutConstraint.activate([
            recoveryGraph.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: LayoutOptions.viewSpacing),
            recoveryGraph.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            recoveryGraph.leftAnchor.constraint(equalTo: view.leftAnchor, constant: LayoutOptions.recoveryGraphMargin),
            recoveryGraph.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -LayoutOptions.recoveryGraphMargin)
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

    func configureRecoveryGraph(viewModel: GlobalSummaryRecoveryGraphViewModel) {
        recoveryGraph.configure(viewModel: viewModel, center: CGPoint(x: recoveryGraph.bounds.maxX/2, y: recoveryGraph.bounds.maxY/2))
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
        cell.configureForType(type: CollectionOption.collectionViewCellOrder[indexPath.row])
        if let CellViewModel = output.cellViewModel(for: indexPath) {
            cell.configure(viewModel: CellViewModel)
        }
        if let graphViewModel = output.graphViewModel(for: indexPath) {
            cell.configureTrendingGraph(xAxisData: graphViewModel.xAxisData, yAxisData: graphViewModel.yAxisData, type: CollectionOption.collectionViewCellOrder[indexPath.row])
        }
        return cell
    }
}

extension GlobalSummaryViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let width = itemWidth(for: view.frame.width, spacing: CollectionOption.cellSpacing)

        return CGSize(width: width, height: CollectionOption.cellHeight)
    }

    func itemWidth(for width: CGFloat, spacing: CGFloat) -> CGFloat {
        let itemsInRow: CGFloat = 2

        let totalSpacing: CGFloat = 2 * spacing + (itemsInRow - 1) * spacing
        let finalWidth = (width - totalSpacing) / itemsInRow

        return floor(finalWidth)
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
