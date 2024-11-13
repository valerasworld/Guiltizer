//
//  Challenge.swift
//  Pleasuroo
//
//  Created by Valery Zazulin on 13/11/24.
//

import SwiftUI

struct Challenge: Identifiable {
    
    let id: UUID = UUID()
    let level: Int
    let title: String
    let shortDescription: String
    let description: String
    let imageName: String
    
    var isLocked: Bool
    var isDoneAngelWay: Bool
}

