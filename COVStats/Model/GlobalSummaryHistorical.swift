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
        for (_,value) in cases {
            timeline.append(value)
        }
        return timeline.sorted()
    }

    var deathTimeline: [Int] {
        var timeline: [Int] = []
        for (_,value) in deaths {
            timeline.append(value)
        }
        return timeline.sorted()
    }

    var recoveredTimeline: [Int] {
        var timeline: [Int] = []
        for (_,value) in recovered {
            timeline.append(value)
        }
        return timeline.sorted()
    }
}
