//
//  NewsNewsInteractor.swift
//  COVStats
//
//  Created by Igor Podolsiy on 06/10/2020.
//  Copyright © 2020 Igor Podolskiy. All rights reserved.
//

class NewsInteractor {

    weak var output: NewsInteractorOutput!

    private let newsService: NewsServiceProtocol = NewsService()

}

extension NewsInteractor: NewsInteractorInput {
    func fetchCovidNews() {
        newsService.fetchCovidNewsData { [weak self] result in
            switch result {
            case .success(let data):
                self?.output.CovidNewsDataDidRiceive(data: data)
            case .failure(let error):
                self?.output.errorReceiveNewsData(errorText: error.errorText)
            }
        }
    }


}
