//
//  Pleasure.swift
//  Pleasuroo
//
//  Created by Valery Zazulin on 13/11/24.
//

import SwiftUI

@Observable
class Pleasure: Identifiable {
    
    let id: UUID = UUID()
    let name: String
    let color: Color
    let imageName: String
    var devilAngel: Int
    let challenges: [Challenge]
    
    init(name: String, color: Color, imageName: String, devilAngel: Int = 0, challenges: [Challenge]) {
        self.name = name
        self.color = color
        self.imageName = imageName
        self.devilAngel = devilAngel
        self.challenges = challenges
    }
}
