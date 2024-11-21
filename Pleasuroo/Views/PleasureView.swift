//
//  PleasureView.swift
//  Pleasuroo
//
//  Created by Valery Zazulin and Saverio Negro on 13/11/24.
//

import SwiftUI

struct PleasureView: View {
    
    @Environment(PleasureViewModel.self) var pleasureViewModel
    var isAngel: Bool { pleasureViewModel.getIsAngelOrDevil() }
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.black
//                Color.blackish.ignoresSafeArea()
                ScrollView {
                    VStack(spacing: 16) {
                        ForEach(pleasureViewModel.pleasures.indices, id: \.self) { index in
                            let pleasure = pleasureViewModel.pleasures[index]
                            NavigationLink {
                                // Levels View
                                LevelsView(title: pleasure.name, image: pleasure.imageName, pleasureIndex: index)
                            } label: {
                                // Card View
                                PleasureCardView(name: pleasure.name, image: pleasure.imageName, pleasureIndex: index, numChallenges: pleasure.challenges.count)
                                    .padding(.horizontal, 20)
                            }

                        }
                    }
                }
            }
            .navigationTitle("Guilty Pleasures")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    HStack {
                        ZStack {
                            Circle()
                                .foregroundStyle(.angel)
                                .frame(width: 30, height: 30)
                            Text("P")
                                .foregroundStyle(.blackish)
                                .bold()
                        }
                        Text("\(pleasureViewModel.coins)")
                            .foregroundStyle(.white)
                            .bold()
                    }
//                    .offset(y: -8)
//                    .padding() //
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    
                    NavigationLink(destination: {
                        DevilAngelView()
                            .toolbarVisibility(.hidden, for: .tabBar)
                    }, label: {
                        
                        HStack {
                            Text("\(abs(pleasureViewModel.getTotalDevilAngelPoints()))")
                                .foregroundStyle(.white)
                                .bold()
                                .offset(x: -5)
                            Image(pleasureViewModel.getIsAngelOrDevil() ? "angel" : "devil")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                                .shadow(color: isAngel ? .angel : .devil, radius: 5)
                        }
//                        .offset(y: -8)
                    })
                }
                
                
                
                ToolbarItem(placement: .bottomBar) {
                    HStack {
                        Image("angel")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 38, height: 38)
                        DevilAngelBarView(barWidth: 268, barHeight: 16, progressType: .total)
                        Image("devil")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 38, height: 38)
                    }
                }
            }
        }
    }
}

#Preview {
    PleasureView()
        .environment(PleasureViewModel())
}
