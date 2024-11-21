//
//  CircleView.swift
//  Pleasuroo
//
//  Created by Saverio Negro on 15/11/24.
//

import SwiftUI

struct CircleView: View {
    
    static let initialDragAmount: CGFloat = 370
    static let finalDragAmount: CGFloat = 550
    static let buttonFinalOffset: CGFloat = -20
    static let buttonInitialOffset: CGFloat = 400
    
    let tolerance: Double = 0
    @State var yDragAmount: CGFloat = CircleView.initialDragAmount
    @Binding var isDragDisabled: Bool
    @Binding var isComplete: Bool
    
    @Binding var buttonOffset: CGFloat
    var deltaDragAmount = CircleView.finalDragAmount - CircleView.initialDragAmount
    var deltaButtonOffset = CircleView.buttonFinalOffset - CircleView.buttonInitialOffset
    
    func getScaleFactor(delta1: Double, delta2: Double) -> Double {
        let x = delta2 / delta1
        return x
    }
    
    var body: some View {
        ZStack {
            Circle()
                .fill(.white)
                .frame(width: 1000)
                .offset(x: 0, y: yDragAmount)
            Image("tail")
                .resizable()
                .scaledToFit()
                .frame(width: 60, height: 300)
                .offset(y: yDragAmount - 390)
                .gesture(
                    DragGesture()
                        .onChanged { attributes in
                            
                            let yTranslation = attributes.translation.height
                            let x = getScaleFactor(delta1: deltaDragAmount, delta2: deltaButtonOffset)
                            
                            if !isDragDisabled {
                                self.yDragAmount = CircleView.initialDragAmount + yTranslation
                                
                                self.buttonOffset = CircleView.buttonInitialOffset + (x * yTranslation)
                                
                                if CircleView.initialDragAmount + yTranslation > (CircleView.finalDragAmount - tolerance) {
                                    yDragAmount = CircleView.finalDragAmount
                                    buttonOffset = CircleView.buttonFinalOffset
                                    isDragDisabled = true
                                }
                            }
                        }
                    
                        .onEnded { attributes in
                            let yTranslation = attributes.translation.height
                            
                            if !isDragDisabled {
                                if CircleView.initialDragAmount + yTranslation < (CircleView.finalDragAmount - tolerance) {
                                    withAnimation(
                                        Animation.spring(duration: 0.5, bounce: 0.7)
                                    ) {
                                        yDragAmount = CircleView.initialDragAmount
                                        buttonOffset = CircleView.buttonInitialOffset
                                    }
                                }
                            }
                            
                        }
                )
        }
        .mask {
            Circle()
                .frame(width: 1000)
                .offset(x: 0, y: yDragAmount)
        }
        .onAppear {
            
            if isComplete {
                isDragDisabled = true
                yDragAmount = CircleView.finalDragAmount
            } else {
                withAnimation(
                    Animation.spring(duration: 0.3, bounce: 0.8, blendDuration: 0.6)
                        .delay(0.5)
                ) {
                    yDragAmount = CircleView.initialDragAmount - 20
                }
            }
        }
    }
}

#Preview {
    CircleView(yDragAmount: 370, isDragDisabled: .constant(false), isComplete: .constant(false), buttonOffset: .constant(150))
}
