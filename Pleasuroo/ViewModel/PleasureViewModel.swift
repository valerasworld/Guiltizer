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
        ]),
        Pleasure(
            name: "Video Games",
            color: .purple,
            imageName: "videogames",
            challenges: [
                Challenge(
                    level: 1,
                    title: "Level Up!",
                    shortDescription: "Play a new game for at least an hour.",
                    description: "Try a game you haven't played before and immerse yourself for at least an hour. It could be any genre—step out of your comfort zone if you're up for it!",
                    imageName: "videogames",
                    isLocked: false,
                    isDoneAngelWay: false
                ),
                Challenge(
                    level: 2,
                    title: "Multiplayer Madness",
                    shortDescription: "Play an online multiplayer game with friends.",
                    description: "Gather your friends for an online gaming session. Win or lose, the goal is to have fun and maybe try a game you've all been wanting to play together.",
                    imageName: "multiplayer",
                    isLocked: false,
                    isDoneAngelWay: false
                ),
                Challenge(
                    level: 3,
                    title: "Speed Run Challenge",
                    shortDescription: "Attempt a speed run in one of your favorite games.",
                    description: "Choose a game you enjoy and try to complete it as quickly as possible. Compete with yourself or watch tutorials for techniques and shortcuts!",
                    imageName: "speedrun",
                    isLocked: true,
                    isDoneAngelWay: false
                )
            ]
        ),
        
        Pleasure(
            name: "Binge Watching",
            color: .orange,
            imageName: "bingewatching",
            challenges: [
                Challenge(
                    level: 1,
                    title: "Series Starter",
                    shortDescription: "Begin a new show you've heard good things about.",
                    description: "Pick a show that's been on your list or recommended to you. Watch the first two episodes and decide if it’s binge-worthy!",
                    imageName: "bingewatch",
                    isLocked: false,
                    isDoneAngelWay: false
                ),
                Challenge(
                    level: 2,
                    title: "Movie Marathon",
                    shortDescription: "Watch three movies in a single genre back-to-back.",
                    description: "Choose a genre—romantic comedies, action, horror, etc.—and watch three movies in that category in a row. Prepare snacks, settle in, and let the marathon begin!",
                    imageName: "moviemarathon",
                    isLocked: false,
                    isDoneAngelWay: false
                ),
                Challenge(
                    level: 3,
                    title: "Season Finale Marathon",
                    shortDescription: "Watch an entire season in one sitting.",
                    description: "Pick a short season or even a long one if you're ready for it, and watch the whole season in a single sitting. Can you make it to the end?",
                    imageName: "seasonfinale",
                    isLocked: true,
                    isDoneAngelWay: false
                )
            ]
        )
        
    ]
    
}
