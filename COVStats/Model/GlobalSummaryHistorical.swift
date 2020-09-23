//
//  GlobalSummaryHistorical.swift
//  COVStats
//
//  Created by Igor Podolskiy on 23.09.2020.
//  Copyright © 2020 Igor Podolskiy. All rights reserved.
//

import Foundation

struct GlobalSummaryHistorical: Decodable {
    let cases: [String:Int]
    let deaths: [String:Int]
    let recovered: [String:Int]

    var casesTimeline: [Int] {
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

    var deathTimeline: [Int] {
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

    var recoveredTimeline: [Int] {
        var timeline: [Int] = []
        var dynamicTimeline: [Int] = []
        for (_,value) in recovered {
            timeline.append(value)
        }
        timeline = timeline.sorted()
        for i in 0..<timeline.count-1 {
            dynamicTimeline.append(timeline[i+1]-timeline[i])
        }
        return dynamicTimeline
    }

    var activeTimeline: [Int] {
        let cases: [Int] = casesTimeline
        let deaths: [Int] = deathTimeline
        let recovered: [Int] = recoveredTimeline
        var dynamicTimeline: [Int] = []
        for i in 0..<min(cases.count,deaths.count,recovered.count) {
            dynamicTimeline.append(cases[i]-deaths[i]-recovered[i])
        }
        return dynamicTimeline

//        var cases: [Int] = []
//        var deaths: [Int] = []
//        var recovered: [Int] = []
//        var timeline: [Int] = []
//        for (_,value) in self.cases {
//            cases.append(value)
//        }
//        cases = cases.sorted()
//        for (_,value) in self.deaths {
//            deaths.append(value)
//        }
//        deaths = deaths.sorted()
//        for (_,value) in self.recovered {
//            recovered.append(value)
//        }
//        recovered = recovered.sorted()
//        for i in 0..<min(cases.count,deaths.count,recovered.count) {
//            timeline.append(cases[i]-deaths[i]-recovered[i])
//        }
//        return timeline
    }
}
