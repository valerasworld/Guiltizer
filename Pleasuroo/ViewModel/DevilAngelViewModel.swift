//
//  DevilAngelViewModel.swift
//  Pleasuroo
//
//  Created by Valery Zazulin on 02/07/25.
//


import SwiftUI

@Observable
class DevilAngelViewModel {
    var isAngel: Bool = true
    var offset = CGSize(width: 0, height: 0)
    var floatingOffset: Double = 7
    var floatingToggle: Bool = true
    var projection: CGFloat = 0
    
    var startTime = Date.now
        
    let devilPoint: CGSize = CGSize(width: -10, height: 150)
    let angelPoint: CGSize = CGSize(width: 10, height: -150)
    
    var startingPoint: CGSize { isAngel ? angelPoint : devilPoint }
    
    var stickBackAnimation: Animation = .spring(duration: 0.4, bounce: 0.1, blendDuration: 5.9)
    
    var farFromInitialPoint: CGFloat {
        distanceFromInitialPoint(isAngel: isAngel,
                                 angelPoint: angelPoint,
                                 devilPoint: devilPoint,
                                 offset: offset)
    }
    
    var farFromOppositePoint: CGFloat {
        distanceFromOppositePoint(isAngel: isAngel,
                                  angelPoint: angelPoint,
                                  devilPoint: devilPoint,
                                  offset: offset)
    }
    
    var initSqrd: CGFloat {
        farFromInitialPoint * farFromInitialPoint
    }
    
    var halfPerimeter: CGFloat {
        (300 + farFromInitialPoint + farFromOppositePoint) / 2
    }
    
    var heightLength: CGFloat {
        (2 / 300) * sqrt(halfPerimeter * (halfPerimeter - farFromInitialPoint) * (halfPerimeter - farFromOppositePoint) * (halfPerimeter - 300))
    }
    
    var heightSqrd: CGFloat {
        heightLength * heightLength
    }
    
    var projectionMultiplier: CGFloat {
        sqrt((initSqrd) - (heightSqrd)) / 300
    }
    
    func distanceFromInitialPoint(isAngel: Bool, angelPoint: CGSize, devilPoint: CGSize, offset: CGSize) -> CGFloat {
        return hypot((isAngel ? angelPoint.width : devilPoint.width) - offset.width,
                     (isAngel ? angelPoint.height : devilPoint.height) - offset.height)
    }
    
    func distanceFromOppositePoint(isAngel: Bool, angelPoint: CGSize, devilPoint: CGSize, offset: CGSize) -> CGFloat {
        return hypot((isAngel ? devilPoint.width : angelPoint.width) - offset.width,
                     (isAngel ? devilPoint.height : angelPoint.height) - offset.height)
    }
}
