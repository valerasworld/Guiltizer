//
//  PleasureCardView.swift
//  Pleasuroo
//
//  Created by Saverio Negro on 14/11/24.
//

import SwiftUI

struct PleasureCardView: View {
    
    let name: String
    let image: String
    let numChallenges: Int
    
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.blue, .indigo], startPoint: .topLeading, endPoint: .bottomTrailing)
                .frame(height: 200)
                .clipShape(.rect(cornerRadius: 20))
                .padding()
                .overlay {
                    HStack(spacing: 10) {
                        Image("burger")
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: 150, maxHeight: 200)
                            .clipShape(.rect(cornerRadius: 20))
                            .padding(.vertical, 30)
                            .padding(.horizontal, 0)
                            .clipped()
                        VStack {
                            VStack(alignment: .leading) {
                                Text("\(name)")
                                    .font(.title2).bold()
                                    .foregroundStyle(.white)
                                Text("\(numChallenges) Challenges")
                                    .font(.subheadline)
                                    .foregroundStyle(.white)
                            }
                            .frame(maxWidth: 150)
                        }
                    }
                }
        }
    }
}

#Preview {
    PleasureCardView(name: "Junk Food", image: "burger", numChallenges: 5)
}
