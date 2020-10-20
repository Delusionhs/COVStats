//
//  NewsService.swift
//  COVStats
//
//  Created by Igor Podolskiy on 07.10.2020.
//  Copyright © 2020 Igor Podolskiy. All rights reserved.
//

import Foundation

protocol NewsServiceProtocol {
    func fetchCovidNewsData(completion: @escaping (NewsResponse?) -> Void)
}

class NewsService: NewsServiceProtocol {
    private enum QueryOptions {
        static let covidQuery = "Covid-19"
        static let apiKey = "aaca6afe1eb348fbbca5f8411bca1560"
    }
    private enum ApiURL {
        static let everythingNews = "https://newsapi.org/v2/everything"
    }

    private let networkService = NetworkService()

    func fetchCovidNewsData(completion: @escaping (NewsResponse?) -> Void) {
        guard let url = URL(string: ApiURL.everythingNews) else { return }
        networkService.getJSONData(URL: url, parameters: ["q": QueryOptions.covidQuery, "apiKey": QueryOptions.apiKey]) { result in
            switch result {
            case .success(let data):
                let summary = try? JSONDecoder().decode(NewsResponse.self, from: data)
                completion(summary)
            case .failure(_):
                completion(nil)
            }
        }
    }
}

