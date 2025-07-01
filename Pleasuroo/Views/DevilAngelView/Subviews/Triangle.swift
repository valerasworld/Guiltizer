//
//  Triangle.swift
//  Pleasuroo
//
//  Created by Valery Zazulin on 02/07/25.
//


import SwiftUI

struct Triangle: Shape {
    
    @Binding var isAngel: Bool
    @Binding var projection: CGFloat
    
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(
                to: .init(x: rect.maxX * (isAngel ?
                                          findBorderOffset(
                                            offset: projection,
                                            minOffset: 1,
                                            maxOffset: 0,
                                            borderValueMin: 1.3,
                                            borderValueMax: 0.7
                                          )
                                          : findBorderOffset(
                                            offset: projection,
                                            minOffset: 1,
                                            maxOffset: 0,
                                            borderValueMin: 0.7,
                                            borderValueMax: 1.3
                                          )),
                          y: rect.maxY))
            path.addLine(to: .init(x: rect.minX, y: rect.maxY))
            path.addLine(to: .init(
                x: rect.minX,
                y: rect.maxY * (isAngel ?
                                findBorderOffset(
                                    offset: projection,
                                    minOffset: 1,
                                    maxOffset: 0,
                                    borderValueMin: -0.3,
                                    borderValueMax: 0.3
                                )
                                : findBorderOffset(
                                    offset: projection,
                                    minOffset: 1,
                                    maxOffset: 0,
                                    borderValueMin: 0.3,
                                    borderValueMax: -0.3
                                ))))
        }
        
    }
    
    func findBorderOffset(offset: CGFloat, minOffset: CGFloat, maxOffset: CGFloat, borderValueMin: CGFloat, borderValueMax: CGFloat) -> CGFloat {
        let borderOffset = findNumberInInterpolatedRange(
            number: offset,
            lowestData: minOffset,
            highestData: maxOffset,
            rangeMin: borderValueMin,
            rangeMax: borderValueMax
        )
        
        return borderOffset
    }
    
    func findNumberInInterpolatedRange(number: CGFloat, lowestData: CGFloat, highestData: CGFloat, rangeMin: CGFloat, rangeMax: CGFloat) -> CGFloat {
        
        let normalisedNumber = (((number - lowestData) * (rangeMax - rangeMin)) / (highestData - lowestData)) + rangeMin
        
        return normalisedNumber
    }
}
