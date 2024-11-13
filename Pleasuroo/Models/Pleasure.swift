//
//  Pleasure.swift
//  Pleasuroo
//
//  Created by Valery Zazulin on 13/11/24.
//

import SwiftUI

struct Pleasure: Identifiable {
    
    let id: UUID = UUID()
    let name: String
    let color: Color
    let imageName: String
    let challenges: [Challenge]
    
}
