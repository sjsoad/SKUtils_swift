//
//  MapCurrentWeatherView+Drawing.swift
//  MyWeather
//
//  Created by Sergey on 26.12.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import UIKit

extension MapCurrentWeatherView {
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        let arrowSize = CGSize(width: 20.0, height: 10.0)
        let rectangleRect = UIEdgeInsetsInsetRect(rect, UIEdgeInsetsMake(borderWidth,
                                                                         borderWidth,
                                                                         arrowSize.height,
                                                                         borderWidth))
        let rectanglePath = UIBezierPath(roundedRect: rectangleRect,
                                         cornerRadius: cornerRadius)
        UIColor.white.setFill()
        ColorsHelper.primaryColor.setStroke()
        rectanglePath.fill()
        rectanglePath.lineWidth = borderWidth
        rectanglePath.stroke()
        
        //// Polygon Drawing
        
        let arrowHalfWidth = arrowSize.width / 2.0
        let middleOfRect: CGFloat = rect.width / 2.0
        let polygonPath = UIBezierPath()
        polygonPath.move(to: CGPoint(x: middleOfRect - arrowHalfWidth,
                                     y: rectangleRect.height + borderWidth))
        polygonPath.addLine(to: CGPoint(x: middleOfRect,
                                        y: rect.height - borderWidth))
        polygonPath.addLine(to: CGPoint(x: middleOfRect + arrowHalfWidth,
                                        y: rectangleRect.height + borderWidth))
        polygonPath.close()
        ColorsHelper.primaryColor.setFill()
        ColorsHelper.primaryColor.setStroke()
        polygonPath.fill()
        polygonPath.lineWidth = borderWidth
        polygonPath.stroke()
    }

    
}
