//
//  Challenge.swift
//  Pleasuroo
//
//  Created by Valery Zazulin on 13/11/24.
//

import SwiftUI

@Observable
class Challenge: Identifiable {
    
    let id: UUID = UUID()
    let level: Int
    let title: String
    let shortDescription: String
    let description: String
    let imageName: String
    
    var isLocked: Bool
    var isComplete: Bool
    var isDoneAngelWay: Bool
    
    init(level: Int, title: String, shortDescription: String, description: String, imageName: String, isLocked: Bool, isComplete: Bool, isDoneAngelWay: Bool) {
        self.level = level
        self.title = title
        self.shortDescription = shortDescription
        self.description = description
        self.imageName = imageName
        self.isLocked = isLocked
        self.isComplete = isComplete
        self.isDoneAngelWay = isDoneAngelWay
    }
}

