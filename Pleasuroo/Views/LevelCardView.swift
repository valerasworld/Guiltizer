//
//  LevelCardView.swift
//  Pleasuroo
//
//  Created by Saverio Negro on 14/11/24.
//

import SwiftUI

struct LevelCardView: View {
    
    let level: Int
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.blue)
                .scaledToFit()
                .frame(maxWidth: 100, maxHeight: 100)
            Text("\(level)")
                .font(.largeTitle)
                .foregroundStyle(.white)
        }
    }
}

#Preview {
    LevelCardView(level: 1)
}
