//
//  Pleasure.swift
//  Pleasuroo
//
//  Created by Valery Zazulin and Saverio Negro on 13/11/24.
//

import SwiftUI

@Observable
class Pleasure: Identifiable {
    
    let id: UUID = UUID()
    let name: String
    let color: Color
    let imageName: String
    var devilAngelPoints: Int
    let challenges: [Challenge]
    
    init(name: String, color: Color, imageName: String, devilAngelPoints: Int = 0, challenges: [Challenge]) {
        self.name = name
        self.color = color
        self.imageName = imageName
        self.devilAngelPoints = devilAngelPoints
        self.challenges = challenges
    }
}
