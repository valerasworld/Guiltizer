//
//  LevelCardView.swift
//  Pleasuroo
//
//  Created by Saverio Negro on 14/11/24.
//

import SwiftUI

struct LevelCardView: View {
    
    let level: Int
    var isLocked: Bool
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.blue)
                .scaledToFit()
                .frame(maxWidth: 100, maxHeight: 100)
                .clipShape(.rect(cornerRadius: 10))
                .overlay {
                    if isLocked {
                        Image(systemName: "lock.fill")
                            .resizable()
                            .scaledToFit()
                            .foregroundStyle(.indigo)
                            .padding(10)
                    }
                }
            Text("\(level)")
                .font(.largeTitle)
                .foregroundStyle(.white)
        }
        .opacity(isLocked ? 0.8 : 1)
    }
}

#Preview {
    LevelCardView(level: 1, isLocked: true)
}
