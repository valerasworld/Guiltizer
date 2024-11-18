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
    let tolerance: Double = 0
    @State var yDragAmount: CGFloat = CircleView.initialDragAmount
    @Binding var isDragDisabled: Bool
    
    var body: some View {
        ZStack {
            Circle()
                .fill(.white)
                .frame(width: 1000)
                .offset(x: 0, y: yDragAmount)
            Rectangle()
                .frame(width: 30, height: 300)
                .offset(y: yDragAmount - 320)
                .gesture(
                    DragGesture()
                        .onChanged { attributes in
                            
                            let yTranslation = attributes.translation.height
                            
                            if !isDragDisabled {
                                self.yDragAmount = CircleView.initialDragAmount + yTranslation
                                
                                if CircleView.initialDragAmount + yTranslation > (CircleView.finalDragAmount - tolerance) {
                                    yDragAmount = CircleView.finalDragAmount
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
            withAnimation(
                Animation.spring(duration: 0.3, bounce: 0.8, blendDuration: 0.6)
                    .delay(0.5)
            ) {
                yDragAmount = CircleView.initialDragAmount - 20
            }
        }
    }
}

#Preview {
    CircleView(yDragAmount: 370, isDragDisabled: .constant(false))
}
