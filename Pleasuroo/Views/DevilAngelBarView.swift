//
//  DevilAngelBarView.swift
//  Pleasuroo
//
//  Created by Saverio Negro on 18/11/24.
//

import SwiftUI

enum Progress {
    case total
    case pleasure
}

struct DevilAngelBarView: View {
    
    @Environment(PleasureViewModel.self) var pleasureViewModel
    
    let barWidth: Double
    let barHeight: Double
    let pleasureIndex: Int
    let progressType: Progress
    var pleasure: Pleasure {
        pleasureViewModel.pleasures[pleasureIndex]
    }
    var challenges: [Challenge] {
        pleasureViewModel.pleasures[pleasureIndex].challenges
    }
    var maxDelta: Double {
        return barWidth / 2
    }
    var deltaStep: Double {
        var numChallenges = 0
        if progressType == .pleasure {
            numChallenges = challenges.count
        } else {
            numChallenges = pleasureViewModel.totalNumChallenges
        }
        return maxDelta / Double(numChallenges)
    }
    @State var increaseAmount: Double = 0 // @State
    
    func setIncreaseAmount(points: Int) {
        withAnimation {
            increaseAmount = deltaStep * Double(points)
        }
    }
    
    init(barWidth: Double, barHeight: Double, pleasureIndex: Int = 0, progressType: Progress) {
        self.barWidth = barWidth
        self.barHeight = barHeight
        self.pleasureIndex = pleasureIndex
        self.progressType = progressType
    }
    
    var body: some View {
        ZStack {
            ZStack(alignment: .leading) {
                Rectangle()
                    .fill(.devil)
                    .frame(width: barWidth)
                Rectangle()
                    .fill(.angel)
                    .frame(width: (barWidth / 2) + increaseAmount)
                
            }
            .frame(width: barWidth, height: barHeight)
            .scaledToFit()
            .clipShape(.rect(cornerRadius: 20))
        }
        .onAppear {
            if progressType == .pleasure {
                setIncreaseAmount(points: pleasure.devilAngelPoints)
            } else {
                setIncreaseAmount(points: pleasureViewModel.getTotalDevilAngelPoints())
            }
        }
    }
}

#Preview {
    DevilAngelBarView(barWidth: 200, barHeight: 30, pleasureIndex: 0, progressType: .pleasure)
        .environment(PleasureViewModel())
}
