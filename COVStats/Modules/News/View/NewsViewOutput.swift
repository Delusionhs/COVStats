//
//  NewsNewsViewOutput.swift
//  COVStats
//
//  Created by Igor Podolsiy on 06/10/2020.
//  Copyright © 2020 Igor Podolskiy. All rights reserved.
//
import  Foundation

protocol NewsViewOutput {
    func viewIsReady()
    func numberOfRows() -> Int
    func cellViewModel(for indexPath: IndexPath) -> NewsTableViewCellViewModel?
}
