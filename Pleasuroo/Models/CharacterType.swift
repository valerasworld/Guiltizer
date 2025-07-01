//
//  CharacterType.swift
//  Pleasuroo
//
//  Created by Valery Zazulin on 02/07/25.
//


import SwiftUI

enum CharacterType {
    case angel, devil
    
    var imageName: String {
        switch self {
        case .angel:
            return "angel"
        case .devil:
            return "devil"
        }
    }
}