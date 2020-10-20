//
//  NewsNewsPresenter.swift
//  COVStats
//
//  Created by Igor Podolsiy on 06/10/2020.
//  Copyright © 2020 Igor Podolskiy. All rights reserved.
//

import Foundation

class NewsPresenter {
    
    weak var view: NewsViewInput!
    var interactor: NewsInteractorInput!
    var router: NewsRouterInput!
    private var newsResponse: NewsResponse?

     func cellViewModelFromData(data: Article) -> NewsTableViewCellViewModel {
        return NewsTableViewCellViewModel(title: data.title, imageURL: data.urlToImage)
    }
}

extension NewsPresenter: NewsInteractorOutput {
    func CovidNewsDataDidRiceive(data: NewsResponse?) {
        newsResponse = data
        view.reloadTableViewData()
    }

    func errorReceiveNewsData(errorText: String) {
        router.stowAlertWithText(text: errorText)
    }
}

extension NewsPresenter: NewsViewOutput {
    func openNews(indexPath: IndexPath) {
        guard let data = newsResponse?.articles, data.count > indexPath.row else { return }
        guard let url = URL(string: data[indexPath.row].url) else {
            return
        }
        router.openNewsWithURL(url: url)
    }

    func viewIsReady() {
        interactor.fetchCovidNews()
    }

    func numberOfRows() -> Int {
        return newsResponse?.articles.count ?? 0
    }

    func cellViewModel(for indexPath: IndexPath) -> NewsTableViewCellViewModel? {
        guard let data = newsResponse?.articles, data.count > indexPath.row else { return nil }
        return cellViewModelFromData(data: data[indexPath.row])
    }
}
