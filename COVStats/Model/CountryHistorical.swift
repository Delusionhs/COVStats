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

    var startDay: Int {
        var days: [String] = []
        for (key,_) in cases {
            days.append(key)
        }
        if let startDateComponents = days.min()?.components(separatedBy: "/"),
           startDateComponents.count == 3 { /* Month/Day/Year */
            return Int(startDateComponents[1]) ?? 0
        }
        return 0
    }

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
