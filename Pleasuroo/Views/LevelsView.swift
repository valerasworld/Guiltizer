//
//  LevelsView.swift
//  Pleasuroo
//
//  Created by Saverio Negro on 13/11/24.
//

import SwiftUI

struct LevelsView: View {
    
    let title: String
    let challenges: [Challenge]
    let columns = [
        /// The grid will fit in as many items per row as possible (`.adaptive()`)
        /// using a minimum size of 50 points and a maximum size of 100 points.
        /// GridItem(.adaptive(minimum: 50, maximum: 100))
        
        /// Control the number of columns to have using `.flexible()`.
        /// `.flexible()` lets you specify how big each item should be, while
        /// controlling how many columns there are.
        GridItem(.flexible(minimum: 50, maximum: 100)),
        GridItem(.flexible(minimum: 50, maximum: 100)),
        GridItem(.flexible(minimum: 50, maximum: 100)),
        GridItem(.flexible(minimum: 50, maximum: 100)),
        GridItem(.flexible(minimum: 50, maximum: 100))
        
        /// Make one of the columns (first) fixed in size, while letting the other/s
        /// adapt and fill up the remaining space.
//        GridItem(.fixed(50)),
//        GridItem(.flexible(minimum: 50, maximum: .infinity))
    ]
    
    var body: some View {
        VStack {
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(challenges) { challenge in
                    NavigationLink {
                        ChallengeCardView(challenge: challenge)
                    } label: {
                        LevelCardView(level: challenge.level)
                    }
                }
            }
        }
        .navigationTitle("\(title)")
        .navigationBarTitleDisplayMode(.inline)
        .padding()
    }
}

#Preview {
    LevelsView(title: "Junk Food",
               challenges: [
                Challenge(
                    level: 1,
                    title: "My Favorite Meal",
                    shortDescription: "Enjoy your favorite junk food.",
                    description: "Enjoy your favorite amazing junk food. Enjoy your favorite junk food.",
                    imageName: "junkfood",
                    isLocked: false,
                    isDoneAngelWay: false
                ),
                Challenge(
                    level: 2,
                    title: "My Ever-Wanted-To-Try Taste",
                    shortDescription: "Plunge into your new food discovery!",
                    description: "You are going to have your palate experience a brand-new taste! Are you ready?",
                    imageName: "junkfood",
                    isLocked: false,
                    isDoneAngelWay: false
                ),
                Challenge(
                    level: 3,
                    title: "Now or Never",
                    shortDescription: "It's yourself versus your never-wanted-to-try food",
                    description: "Are you ready to level up and open yourself to a pleasure you've never wanted to try? If you ever end up going to town with that food, don't forget to thank me.",
                    imageName: "junkfood",
                    isLocked: false,
                    isDoneAngelWay: false
                )
               ])
}
