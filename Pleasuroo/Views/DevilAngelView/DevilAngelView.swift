//
//  DevilAngelView.swift
//  Pleasuroo
//
//  Created by Valery Zazulin on 14/11/24.
//

import SwiftUI

struct DevilAngelView: View {
    
    @Environment(PleasureViewModel.self) var pleasureViewModel
    
    @State var viewModel = DevilAngelViewModel()
    
    var body: some View {
        TimelineView(.animation()) { tl in
            let time = tl.date.timeIntervalSince(viewModel.startTime)
            ZStack {
                // Angel BG
                AngelBackgroundView()
                
                // Angel View
                CharacterView(
                    character: .angel,
                    viewModel: $viewModel,
                    time: time
                )
                
                // Devil BG
                DevilBackgroundView(isAngel: $viewModel.isAngel, projection: $viewModel.projection)
                
                // Devil View
                CharacterView(
                    character: .devil,
                    viewModel: $viewModel,
                    time: time
                )
                
                // Devil Mask
                .mask {
                    Triangle(isAngel: $viewModel.isAngel, projection: $viewModel.projection)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .ignoresSafeArea()
                }
                .onAppear {
                    viewModel.isAngel = pleasureViewModel.getIsAngelOrDevil()
                    viewModel.offset = viewModel.startingPoint

                }
                /*
                 // - - - Utilities
                 //                VStack {
                 //                    Spacer()
                 //                    Button("Toggle") {
                 //                        withAnimation(.easeInOut) {
                 //                            isAngel.toggle()
                 //                        }
                 //                    }
                 //                    Text(verbatim: "\(Int(offset.width/* - angelPoint.width)*/))" + "\n" + "\(Int(offset.height/* - angelPoint.height*/))")
                 //                    Text(Int(borderOffset).description)
                 ////                    Text(screenSize.debugDescription)
                 ////                    Text("ScreenCenter: \(screenCenter.debugDescription)")
                 ////                    Text("ViewPos: \(Int(viewPosition.x)); \(Int(viewPosition.y))")
                 ////                    Text("FromCenter: \(Int(farFromCenter))")
                 //
                 //                    Text("From POINT: \(Int(farFromInitialPoint))")
                 //                    Text("From OPPOSITE: \(Int(farFromOppositePoint))")
                 //                    Text("BORDER OFFSET: \(Int(borderOffset))")
                 //                    Text("PROJECTION M: \(projectionMultiplier)")
                 //                }
                 }
                 */
                
                
            }
        }
    }
    
    
}

#Preview {
    DevilAngelView()
        .environment(PleasureViewModel())
}



