//
//  CountryDetailHistorical.swift
//  COVStats
//
//  Created by Igor Podolskiy on 05.10.2020.
//  Copyright © 2020 Igor Podolskiy. All rights reserved.
//

import Foundation

struct CountryHistorical: Decodable {
    let timeline: CountryHistoricalTimeline
}

struct CountryHistoricalTimeline: Decodable {
    let cases: [String:Int]
    let deaths: [String:Int]

    var casesPerDayTimeline: [Int] {
        var timeline: [Int] = []
        var dynamicTimeline: [Int] = []
        for (_,value) in cases {
            timeline.append(value)
        }
        timeline = timeline.sorted()
        for i in 0..<timeline.count-1 {
            dynamicTimeline.append(timeline[i+1]-timeline[i])
        }
        return dynamicTimeline
    }

    var deathsPerDayTimeline: [Int] {
        var timeline: [Int] = []
        var dynamicTimeline: [Int] = []
        for (_,value) in deaths {
            timeline.append(value)
        }
        timeline = timeline.sorted()
        for i in 0..<timeline.count-1 {
            dynamicTimeline.append(timeline[i+1]-timeline[i])
        }
        return dynamicTimeline
    }
}
