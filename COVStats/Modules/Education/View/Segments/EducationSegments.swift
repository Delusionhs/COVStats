//
//  EducationBodySegments.swift
//  COVStats
//
//  Created by Igor Podolskiy on 14.10.2020.
//  Copyright © 2020 Igor Podolskiy. All rights reserved.
//

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

    enum Symptons {

    }

    enum Diagnosis {
    }
}
