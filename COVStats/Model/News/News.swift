//
//  News.swift
//  COVStats
//
//  Created by Igor Podolskiy on 07.10.2020.
//  Copyright © 2020 Igor Podolskiy. All rights reserved.
//

import Foundation

struct NewsResponse: Decodable {
    let articles: [Article]
}

struct Article: Decodable {
    let title: String
    let url: String
    let urlToImage: String
}
