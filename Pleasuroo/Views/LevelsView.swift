//
//  LevelsView.swift
//  Pleasuroo
//
//  Created by Saverio Negro on 13/11/24.
//

import SwiftUI

struct LevelsView: View {
    
    @Environment(PleasureViewModel.self) var pleasureViewModel
    
    let title: String
    let image: String
    let pleasureIndex: Int
    var challenges: [Challenge]
    @State var challengesCompleted = 0.0
    let columns = [
        /// The grid will fit in as many items per row as possible (`.adaptive()`)
        /// using a minimum size of 50 points and a maximum size of 100 points.
        /// GridItem(.adaptive(minimum: 50, maximum: 100))
        
        /// Control the number of columns to have using `.flexible()`.
        /// `.flexible()` lets you specify how big each item should be, while
        /// controlling how many columns there are.
        GridItem(.flexible(minimum: 50, maximum: 100)),
        GridItem(.flexible(minimum: 50, maximum: 100)),
        GridItem(.flexible(minimum: 50, maximum: 100))
        
        /// Make one of the columns (first) fixed in size, while letting the other/s
        /// adapt and fill up the remaining space.
        //        GridItem(.fixed(50)),
        //        GridItem(.flexible(minimum: 50, maximum: .infinity))
    ]
    
    var body: some View {
        ZStack {
            Image(image)
                .resizable()
                .scaledToFit()
                .clipShape(.circle)
                .frame(minWidth: 1000)
                .offset(x: 0, y: 300)
                .opacity(0.1)
            VStack {
                // Implement functionality for progress view
                ProgressView(value: challengesCompleted, total: Double(challenges.count))
                    .frame(width: 300)
                
                LazyVGrid(columns: columns, spacing: 10) {
                    ForEach(challenges) { challenge in
                        NavigationLink {
                            ChallengeCardView(pleasureIndex: pleasureIndex, challenge: challenge)
                                .toolbar(.hidden, for: .tabBar)
                        } label: {
                            LevelCardView(level: challenge.level, isLocked: challenge.isLocked)
                        }
                        .disabled(challenge.isLocked)
                    }
                }
                .padding(.vertical, 20)
                Spacer()
            }
            .padding(.vertical, 20)
        }
        .navigationTitle("\(title)")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            challengesCompleted = Double(pleasureViewModel.getNumChallengesDone(pleasureIndex: pleasureIndex))
            print(challengesCompleted)
        }
    }
}

#Preview {
    LevelsView(
        title: "Junk Food",
        image: "junk_food",
        pleasureIndex: 0,
        challenges: [
            Challenge(
                level: 1,
                title: "My Favorite Meal",
                shortDescription: "Enjoy your favorite junk food.",
                description: "Enjoy your favorite amazing junk food. Enjoy your favorite junk food.",
                imageName: "junkfood",
                isLocked: false,
                isComplete: false,
                isDoneAngelWay: false
            ),
            Challenge(
                level: 2,
                title: "My Wanted-To-Try Taste",
                shortDescription: "Plunge into your new food discovery!",
                description: "You are going to have your palate experience a brand-new taste! Are you ready?",
                imageName: "junkfood",
                isLocked: true,
                isComplete: false,
                isDoneAngelWay: false
            ),
            Challenge(
                level: 3,
                title: "Now or Never",
                shortDescription: "It's yourself versus your never-wanted-to-try food",
                description: "Are you ready to level up and open yourself to a pleasure you've never wanted to try? If you ever end up going to town with that food, don't forget to thank me.",
                imageName: "junkfood",
                isLocked: true,
                isComplete: false,
                isDoneAngelWay: false
            ),
            Challenge(
                level: 4,
                title: "Build Your Own Burger",
                shortDescription: "Customize the ultimate junk food treat.",
                description: "Get creative and build your own burger or sandwich using your favorite ingredients. Experiment with flavors and textures to create a masterpiece!",
                imageName: "burger",
                isLocked: true,
                isComplete: false,
                isDoneAngelWay: false
            ),
            Challenge(
                level: 5,
                title: "Junk Food Around the World",
                shortDescription: "Taste junk food from different cuisines.",
                description: "Try a junk food dish from another country! Maybe tacos, poutine, or sushi rolls—you’ll discover new guilty pleasures.",
                imageName: "worldjunkfood",
                isLocked: true,
                isComplete: false,
                isDoneAngelWay: false
            )
        ])
    .environment(PleasureViewModel())
}
