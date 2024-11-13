//
//  PleasureViewModel.swift
//  Pleasuroo
//
//  Created by Valery Zazulin on 13/11/24.
//

import SwiftUI

@Observable
class PleasureViewModel {
    
    let pleasures: [Pleasure] = [
        Pleasure(name: "Junk Food", color: .red, imageName: "junkfood", challenges: [
            Challenge(
                level: 1,
                title: "My Favorite Meal",
                shortDescription: "Enjoy your favorite junk food.",
                description: "Enjoy your favorite amazing junk food. Enjoy your favorite junk food.",
                imageName: "junkfood",
                isLocked: false,
                isDoneAngelWay: false
            )
        ]),
        
    ]
    
}
