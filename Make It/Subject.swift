//
//  Subject.swift
//  Make It
//
//  Created by 清水　佳奈音 on 2022/09/07.
//

import Foundation
import UIKit

enum Subject: String, CaseIterable{
    case english
    case japanese
    case math
    
    var title: String {
        switch self {
        case .english:
            return "English"
        case .japanese:
            return "Japanese"
        case .math:
            return "Math"
        }
    }
    var Color: UIColor {
        switch self {
        case .english:
            return .systemRed
        case .japanese:
            return .systemOrange
        case .math:
            return .systemBlue
        }
    }
}
