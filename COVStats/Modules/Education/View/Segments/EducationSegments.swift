//
//  EducationBodySegments.swift
//  COVStats
//
//  Created by Igor Podolskiy on 14.10.2020.
//  Copyright © 2020 Igor Podolskiy. All rights reserved.
//

enum Frequency {
    case rare
    case sometimes
    case common
    case undetermined
}


enum EducationSegments {
    case prevention
    case symptoms
    case diagnosis
    
    enum Prevention: CaseIterable {
        case cleanHands
        case wearFaceMask
        case touchingFace
        case closeContacts

        var imageName: String {
            switch self {
            case .cleanHands:
                return "preventionHand"
            case .wearFaceMask:
                return "preventionMask"
            case .touchingFace:
                return "preventionFace"
            case .closeContacts:
                return "preventionContact"
            }
        }

        var titleText: String {
            switch self {
            case .cleanHands:
                return "Clean your hands often"
            case .wearFaceMask:
                return "Wear a facemask"
            case .touchingFace:
                return "Avoid touching your face"
            case .closeContacts:
                return "Avoid close contact"
            }
        }

        var tabText: String {
            switch self {
            case .cleanHands:
                return "Wash hands often with soap and water for at least 20s"
            case .wearFaceMask:
                return "You should wear facemask when you are around other people"
            case .touchingFace:
                return "Hands touch many surfaces and can pick up viruses"
            case .closeContacts:
                return "Put distance between yourself and other people"
            }
        }
    }

    enum Symptons: CaseIterable {
        case shortnessOfBreath
        case fever
        case cough
        case fatigue
        case aches
        case chills
        case headache
        case throat
        case sneezing
        case stuffy

        var tabText: String {
            switch self {
            case .shortnessOfBreath:
                return "Shortness of breath"
            case .fever:
                return "Fever"
            case .cough:
                return "Cough, chest discomfort"
            case .fatigue:
                return "Fatigue, weakness"
            case .aches:
                return "Aches"
            case .chills:
                return "Chills"
            case .headache:
                return "Headache"
            case .throat:
                return "Sore throat"
            case .sneezing:
                return "Sneezing"
            case .stuffy:
                return "Stuffy, runny nose"
            }
        }

        var frequency: [Frequency] {
            switch self {
            case .shortnessOfBreath:
                return [.rare,.rare,.common]
            case .fever:
                return [.rare,.common,.common]
            case .cough:
                return [.sometimes,.common,.common]
            case .fatigue:
                return [.sometimes,.common,.undetermined]
            case .aches:
                return [.rare,.common,.undetermined]
            case .chills:
                return [.rare,.common,.undetermined]
            case .headache:
                return [.rare,.common,.undetermined]
            case .throat:
                return [.common,.sometimes,.undetermined]
            case .sneezing:
                return [.common,.sometimes,.undetermined]
            case .stuffy:
                return [.common,.sometimes,.undetermined]
            }
        }

    }

    enum Diagnosis {
    }
}
