//
//  Language.swift
//  SwifUITranslation
//
//  Created by Doug Holland on 10/3/24.
//

import Foundation

enum Language: String, CaseIterable {
    case french = "fr-FR"
    
    case german = "de-DE"
    
    case japanese = "ja-JP"
    
    var name: String {
        switch self {
        case .french: 
            return "French"
            
        case .german: 
            return "German"
        
        case .japanese: 
            return "Japanese"
        }
    }
}
