//
//  ViewController.swift
//  LimitSmoking
//
//  Created by Michał Riske on 03/12/2021.
//

import UIKit

class ViewController: UIViewController {

    var shapeLayer = CAShapeLayer() //moved to top of the class so every function can access it
    var gradientLayer: CAGradientLayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
    
        //CAShapeLayer is a class for drawing shapes, empty constructor
        let center = view.center //center of the current view assigned to constanst
        
        //background stroke (track)
        let shapeLayerBackround = CAShapeLayer ()
        
        let circularPathBackground = UIBezierPath(arcCenter: center, radius: 100, startAngle: -CGFloat.pi/2 , endAngle: 2*CGFloat.pi, clockwise: true)
        
        shapeLayerBackround.path = circularPathBackground .cgPath
        shapeLayerBackround.strokeColor = UIColor.black.cgColor
        shapeLayerBackround.lineWidth = 15
        shapeLayerBackround.lineCap = CAShapeLayerLineCap.round
        shapeLayerBackround.fillColor = UIColor.clear.cgColor
    
        view.layer.addSublayer(shapeLayerBackround)
        
        //animation stroke
        let circularPath = UIBezierPath(arcCenter: center, radius: 100, startAngle: -CGFloat.pi/2 , endAngle: 2*CGFloat.pi, clockwise: true)
        
        shapeLayer.path = circularPath.cgPath
        shapeLayer.strokeColor = UIColor.green.cgColor //place gradient here
        shapeLayer.lineWidth = 15
        shapeLayer.strokeEnd = 0
        shapeLayer.lineCap = CAShapeLayerLineCap.round
        shapeLayer.fillColor = UIColor.clear.cgColor
    
        view.layer.addSublayer(shapeLayer) //adding item to view
        
        
//        //gradient
        gradientLayer = CAGradientLayer()
        gradientLayer.startPoint = CGPoint(x: 1.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        gradientLayer.colors = [UIColor.green.cgColor, UIColor.yellow.cgColor]
        gradientLayer.frame = view.bounds
        //gradientLayer.mask = circularPath
        
        
        
        
        
        //add tap gesture, to execute some code
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap))) //i need to define handleTap function
    
    }
    
    @objc private func handleTap() {
        print("Animation is going")
        
        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")  //keyPath is the thing that we want to animate
        basicAnimation.toValue = 1
        basicAnimation.duration = 1.5 //2 seconds
        basicAnimation.fillMode = CAMediaTimingFillMode.forwards //don't know what it does, but you need this for animation to stay
        basicAnimation.isRemovedOnCompletion = false
        
        shapeLayer.add(basicAnimation, forKey: "Basic animation")
        
       
    }

}


