//
//  ProgressBar.swift
//  LimitSmoking
//
//  Created by Michał Riske on 11/12/2021.
//

import UIKit

class ProgressBar: UIView {

    private var backgroundLayer: CAShapeLayer!
    private var foregroundLayer: CAShapeLayer!
    private var textLayer: CATextLayer!
    private var gradientLayer: CAGradientLayer!
    
    override func draw(_ rect: CGRect) {
        
        let width = rect.width
        let height = rect.height
        let center = CGPoint(x: width/2, y: height/2)
        let lineWidth: CGFloat = 0.15 * width
        let radius: CGFloat = (width - lineWidth)/2
    
        let circularPath = UIBezierPath(arcCenter: center, radius: radius, startAngle: -(CGFloat.pi)/2, endAngle: (CGFloat.pi)*1.5, clockwise: true)
        
        //background layer (track)
        backgroundLayer = CAShapeLayer()
        backgroundLayer.path = circularPath.cgPath
        backgroundLayer.strokeColor = UIColor.lightGray.cgColor
        backgroundLayer.fillColor = UIColor.clear.cgColor //inside of circle
        backgroundLayer.lineCap = .round
        backgroundLayer.lineWidth = lineWidth
        
        //foreground layer (animation)
        foregroundLayer = CAShapeLayer()
        foregroundLayer.path = circularPath.cgPath
        foregroundLayer.strokeColor = UIColor.red.cgColor
        foregroundLayer.fillColor = UIColor.clear.cgColor //inside of circle
        foregroundLayer.lineCap = .round
        foregroundLayer.lineWidth = lineWidth
        foregroundLayer.strokeEnd = 0.5 //value of progress
        
        //gradient layer
        gradientLayer = CAGradientLayer()
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1)
        gradientLayer.colors = [UIColor.red.cgColor, UIColor.orange.cgColor]
        gradientLayer.frame = rect
        gradientLayer.mask = foregroundLayer //remeber that step
        
        //layering
        layer.addSublayer(backgroundLayer) //adding sublayer
        layer.addSublayer(gradientLayer) //adding sublayer
        
        
        
    }
  

}
