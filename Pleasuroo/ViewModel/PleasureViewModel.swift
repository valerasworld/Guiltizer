//
//  PleasureViewModel.swift
//  Pleasuroo
//
//  Created by Valery Zazulin and Saverio Negro on 13/11/24.
//

import SwiftUI

@Observable
class PleasureViewModel {
    
    let pleasures: [Pleasure] = [
        Pleasure(name: "Junk Food", color: .red, imageName: "junk_food", challenges: [
            Challenge(
                level: 1,
                title: "My Favorite Meal",
                shortDescription: "Enjoy your favorite junk food.",
                description: "Enjoy your favorite junk food.",
                imageName: "junk_food",
                isLocked: false,
                isComplete: false,
                isDoneAngelWay: false
            ),
            Challenge(
                level: 2,
                title: "My Wanted-To-Try Taste",
                shortDescription: "Plunge into your new food discovery!",
                description: "You are going to have your palate experience a brand-new taste! Are you ready?",
                imageName: "junk_food",
                isLocked: true,
                isComplete: false,
                isDoneAngelWay: false
            ),
            Challenge(
                level: 3,
                title: "Now or Never",
                shortDescription: "It's yourself versus your never-wanted-to-try food",
                description: "Are you ready to level up and open yourself to a pleasure you've never wanted to try? If you ever end up going to town with that food, don't forget to thank me.",
                imageName: "junk_food",
                isLocked: true,
                isComplete: false,
                isDoneAngelWay: false
            ),
            Challenge(
                level: 4,
                title: "Build Your Own Burger",
                shortDescription: "Customize the ultimate junk food treat.",
                description: "Get creative and build your own burger or sandwich using your favorite ingredients. Experiment with flavors and textures to create a masterpiece!",
                imageName: "junk_food",
                isLocked: true,
                isComplete: false,
                isDoneAngelWay: false
            ),
            Challenge(
                level: 5,
                title: "Junk Food Around the World",
                shortDescription: "Taste junk food from different cuisines.",
                description: "Try a junk food dish from another country! Maybe tacos, poutine, or sushi rolls—you’ll discover new guilty pleasures.",
                imageName: "junk_food",
                isLocked: true,
                isComplete: false,
                isDoneAngelWay: false
            )
        ]),
        Pleasure(
            name: "Video Games",
            color: .purple,
            imageName: "video_games",
            challenges: [
                Challenge(
                    level: 1,
                    title: "Level Up!",
                    shortDescription: "Play a new game for at least an hour.",
                    description: "Try a game you haven't played before and immerse yourself for at least an hour. It could be any genre—step out of your comfort zone if you're up for it!",
                    imageName: "video_games",
                    isLocked: false,
                    isComplete: false,
                    isDoneAngelWay: false
                ),
                Challenge(
                    level: 2,
                    title: "Multiplayer Madness",
                    shortDescription: "Play an online multiplayer game with friends.",
                    description: "Gather your friends for an online gaming session. Win or lose, the goal is to have fun and maybe try a game you've all been wanting to play together.",
                    imageName: "video_games",
                    isLocked: true,
                    isComplete: false,
                    isDoneAngelWay: false
                ),
                Challenge(
                    level: 3,
                    title: "Speed Run Challenge",
                    shortDescription: "Attempt a speed run in one of your favorite games.",
                    description: "Choose a game you enjoy and try to complete it as quickly as possible. Compete with yourself or watch tutorials for techniques and shortcuts!",
                    imageName: "video_games",
                    isLocked: true,
                    isComplete: false,
                    isDoneAngelWay: false
                ),
                Challenge(
                    level: 4,
                    title: "Retro Revival",
                    shortDescription: "Play a classic game from your childhood.",
                    description: "Revisit a retro game that brings back nostalgic memories. Whether it’s an old console game or an early PC favorite, relive the good old days.",
                    imageName: "video_games",
                    isLocked: true,
                    isComplete: false,
                    isDoneAngelWay: false
                ),
                Challenge(
                    level: 5,
                    title: "Genre Master",
                    shortDescription: "Master a game genre you usually avoid.",
                    description: "Step out of your comfort zone and try a genre you don’t usually play—be it puzzle games, sports games, or simulations. Learn the ropes and challenge yourself!",
                    imageName: "video_games",
                    isLocked: true,
                    isComplete: false,
                    isDoneAngelWay: false
                )
            ]
        ),
        
        Pleasure(
            name: "Binge Watching",
            color: .orange,
            imageName: "binge_watching",
            challenges: [
                Challenge(
                    level: 1,
                    title: "Series Starter",
                    shortDescription: "Begin a new show you've heard good things about.",
                    description: "Pick a show that's been on your list or recommended to you. Watch the first two episodes and decide if it’s binge-worthy!",
                    imageName: "binge_watching",
                    isLocked: false,
                    isComplete: false,
                    isDoneAngelWay: false
                ),
                Challenge(
                    level: 2,
                    title: "Movie Marathon",
                    shortDescription: "Watch three movies in a single genre back-to-back.",
                    description: "Choose a genre—romantic comedies, action, horror, etc.—and watch three movies in that category in a row. Prepare snacks, settle in, and let the marathon begin!",
                    imageName: "binge_watching",
                    isLocked: true,
                    isComplete: false,
                    isDoneAngelWay: false
                ),
                Challenge(
                    level: 3,
                    title: "Season Finale Marathon",
                    shortDescription: "Watch an entire season in one sitting.",
                    description: "Pick a short season or even a long one if you're ready for it, and watch the whole season in a single sitting. Can you make it to the end?",
                    imageName: "binge_watching",
                    isLocked: true,
                    isComplete: false,
                    isDoneAngelWay: false
                ),
                Challenge(
                    level: 4,
                    title: "Foreign Film Fiesta",
                    shortDescription: "Watch a show or movie in another language.",
                    description: "Choose a show or movie in a language you don’t speak and watch it with subtitles. Immerse yourself in a new culture and storytelling style.",
                    imageName: "binge_watching",
                    isLocked: true,
                    isComplete: false,
                    isDoneAngelWay: false
                ),
                Challenge(
                    level: 5,
                    title: "Classic Watchlist",
                    shortDescription: "Watch a critically acclaimed classic.",
                    description: "Find a classic show or movie that’s widely considered a masterpiece. Experience the storytelling and cinematography of a bygone era.",
                    imageName: "binge_watching",
                    isLocked: true,
                    isComplete: false,
                    isDoneAngelWay: false
                )
            ]
        ),
        Pleasure(
            name: "Drink",
            color: .cyan,
            imageName: "drink",
            challenges: [
                Challenge(
                    level: 1,
                    title: "The Classic Favorite",
                    shortDescription: "Enjoy your favorite drink.",
                    description: "Relax and savor your favorite beverage. Whether it’s coffee, tea, soda, or juice, take a moment to enjoy it mindfully.",
                    imageName: "drink",
                    isLocked: false,
                    isComplete: false,
                    isDoneAngelWay: false
                ),
                Challenge(
                    level: 2,
                    title: "DIY Mixologist",
                    shortDescription: "Create your own unique drink.",
                    description: "Experiment with ingredients to make a custom drink. Try combining flavors, adding garnishes, or recreating a drink you love from a café or bar.",
                    imageName: "drink",
                    isLocked: true,
                    isComplete: false,
                    isDoneAngelWay: false
                ),
                Challenge(
                    level: 3,
                    title: "Exotic Exploration",
                    shortDescription: "Try a drink from a different culture.",
                    description: "Step out of your comfort zone and taste a drink you’ve never had before. It could be a matcha latte, a lassi, or even a tropical smoothie—expand your palate!",
                    imageName: "drink",
                    isLocked: true,
                    isComplete: false,
                    isDoneAngelWay: false
                ),
                Challenge(
                    level: 4,
                    title: "Seasonal Sips",
                    shortDescription: "Try a seasonal or holiday drink.",
                    description: "Order or create a drink tied to the current season—like pumpkin spice in fall, eggnog in winter, or a refreshing lemonade in summer. Enjoy the flavors of the season!",
                    imageName: "drink",
                    isLocked: true,
                    isComplete: false,
                    isDoneAngelWay: false
                ),
                Challenge(
                    level: 5,
                    title: "Blind Tasting",
                    shortDescription: "Do a blind taste test of different drinks.",
                    description: "Choose several types of a similar drink (e.g., sodas, teas, or beers) and blindfold yourself. See if you can identify each one—or just enjoy the fun of tasting them!",
                    imageName: "drink",
                    isLocked: true,
                    isComplete: false,
                    isDoneAngelWay: false
                )
            ]
        )
    ]
    var totalNumChallenges: Int {
        var count = 0
        
        for pleasure in pleasures {
            count += pleasure.challenges.count
        }
        
        return count
    }
    
    var coins: Int = 0
    
    func getNumChallengesDone(pleasureIndex: Int) -> Int {
        let challenges = pleasures[pleasureIndex].challenges
        var count = 0
        
        for challenge in challenges {
            if challenge.isComplete {
                count += 1
            }
        }
        return count
    }
    
    func getTotalDevilAngelPoints() -> Int {
        var count = 0
        for pleasure in pleasures {
            count += pleasure.devilAngelPoints
        }
        return count
    }
}
