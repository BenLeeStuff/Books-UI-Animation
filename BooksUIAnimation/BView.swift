//
//  BView.swift
//  BooksUIAnimation
//
//  Created by Ben Lee on 3/27/23.
//

import UIKit

class BView: UIView {
    
    let bShapeLayer = CAShapeLayer()
    let bHolesShapeLayer = CAShapeLayer()
    let graySectionsLayer = CAShapeLayer()
    
    let initialBounds = CGRect(x: 0, y: 23, width: 71, height: 63)
    let finalBounds = CGRect(x: 104, y: 0, width: 97, height: 110)

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    override func layoutSubviews() {
        initialSetup()
    }
    
    func initialSetup() {
        drawInitialShape()
        setupShapeLayerAttributes()
    }
    
    func setupShapeLayerAttributes() {
        self.bShapeLayer.fillColor = UIColor.black.cgColor
        layer.addSublayer(bShapeLayer)
        
        self.bHolesShapeLayer.fillColor = UIColor.white.cgColor
        layer.addSublayer(bHolesShapeLayer)
        
        self.graySectionsLayer.fillColor = UIColor.lightGray.cgColor
        layer.addSublayer(graySectionsLayer)
  
    }
    
    func drawInitialShape() {
        self.bShapeLayer.path = initialBPath().cgPath
        self.bHolesShapeLayer.path = initialBHolesPath().cgPath
        self.graySectionsLayer.path = initialGraySectionsPath().cgPath
    }
    
    func initialBPath() -> UIBezierPath {
        let path = UIBezierPath()
        let p1 = CGPoint(x: initialBounds.minX, y: initialBounds.minY) //Top left corner
        let p2 = CGPoint(x: initialBounds.minX, y: 75) //bottom left corner
        let p3 = CGPoint(x: 23, y: 86) //center corner
        let p4 = CGPoint(x: 53, y: 86) //start of lower arc
        
        let lowerArcCenter = CGPoint(x: 56, y: 71)
        let upperArcCenter = CGPoint(x: 56, y: 48)
        
        let p5 = CGPoint(x: 43, y: 26) //start of quad curve
        let controlPoint = CGPoint(x: 36.7, y: 23)
        let p6 = CGPoint(x: 26, y: 23)
        
        path.move(to: p1)
        path.addLine(to: p2)
        path.addLine(to: p3)
        path.addLine(to: p4)
        path.addArc(withCenter: lowerArcCenter, radius: 30/2, startAngle: CGFloat.pi/2, endAngle: 3*CGFloat.pi/2, clockwise: false)
        path.addArc(withCenter: upperArcCenter, radius: 29/2, startAngle: CGFloat.pi/2, endAngle: (3*CGFloat.pi/2) + (27*CGFloat.pi/180), clockwise: false)
        path.addLine(to: p5)
        path.addQuadCurve(to: p6, controlPoint: controlPoint)
        path.addLine(to: p1)
        
        path.close()
        return path
    }
    
    func initialBHolesPath() -> UIBezierPath {
        let path = UIBezierPath()
        let p1t = CGPoint(x: 24, y: 40)
        let p2t = CGPoint(x: 56, y: 40)
        let upperArcCenter = CGPoint(x: 56, y: 48)
        let p3t = CGPoint(x: 24, y: 56)
        
        path.move(to: p1t)
        path.addLine(to: p2t)
        path.addArc(withCenter: upperArcCenter, radius: 8, startAngle: 3*CGFloat.pi/2, endAngle: CGFloat.pi/2, clockwise: true)
        path.addLine(to: p3t)
        path.addLine(to: p1t)
        path.close()
        
        let p1b = CGPoint(x: 24, y: 63)
        let p2b = CGPoint(x: 56, y: 63)
        let lowerArcCenter = CGPoint(x: 56, y: 71)
        let p3b = CGPoint(x: 24, y: 79)
        
        path.move(to: p1b)
        path.addLine(to: p2b)
        path.addArc(withCenter: lowerArcCenter, radius: 8, startAngle: 3*CGFloat.pi/2, endAngle: CGFloat.pi/2, clockwise: true)
        path.addLine(to: p3b)
        path.addLine(to: p1b)
        path.close()
        
        return path
    }
    
    func initialGraySectionsPath() -> UIBezierPath {
        let path = UIBezierPath()
        let p1t = CGPoint(x: 6, y: 32)
        let p2t = CGPoint(x: 24, y: 40)
        let p3t = CGPoint(x: 24, y: 56)
        let p4t = CGPoint(x: 6, y: 48)
        
        path.move(to: p1t)
        path.addLine(to: p2t)
        path.addLine(to: p3t)
        path.addLine(to: p4t)
        path.addLine(to: p1t)
        path.close()
        
        let p1b = CGPoint(x: 6, y: 54)
        let p2b = CGPoint(x: 24, y: 63)
        let p3b = CGPoint(x: 24, y: 79)
        let p4b = CGPoint(x: 6, y: 71)
        
        path.move(to: p1b)
        path.addLine(to: p2b)
        path.addLine(to: p3b)
        path.addLine(to: p4b)
        path.addLine(to: p1b)
        path.close()
        
        return path
    }
    
    func expandedBPath() -> UIBezierPath {
        let path = UIBezierPath()
        let p1 = CGPoint(x: finalBounds.minX, y: finalBounds.minY) //top left corner
        let p2 = CGPoint(x: finalBounds.minX, y: 91) // bottom left corner
        let p3 = CGPoint(x: 115, y: 109) // center corner
        let p4 = CGPoint(x: 175, y: 109) // start of lower arc
        let lowerArcCenter = CGPoint(x: 175, y: 84) // center of lower arc
        let upperArcCenter = CGPoint(x: 174.5, y: 43.5)// center of upper arc
        let p5 = CGPoint(x: 191, y: 20) // start of quad curve 1,2
        let controlPoint1 = CGPoint(x: 200, y: 31.41) // control point
        let p6 = CGPoint(x: 153, y: 0) // end of quad curve 2
        let controlPoint2 = CGPoint(x: 175.29, y: 0)// control point
        
        let radius: CGFloat = 25
        let startAngle = CGFloat.pi / 2
        
        path.move(to: p1)
        path.addLine(to: p2)
        path.addLine(to: p3)
        path.addLine(to: p4)
        path.addArc(withCenter: lowerArcCenter, radius: radius, startAngle: startAngle, endAngle: 3*startAngle, clockwise: false)
        path.addArc(withCenter: upperArcCenter, radius: radius, startAngle: startAngle, endAngle: 0, clockwise: false)
        path.addQuadCurve(to: p5, controlPoint: controlPoint1)
        path.addQuadCurve(to: p6, controlPoint: controlPoint2)
        path.addLine(to: p1)
        path.close()

        return path
    }
    
    func expandedBHolesPath() -> UIBezierPath {
        let radius: CGFloat = 15
        let endAngle = CGFloat.pi/2
        let path = UIBezierPath()
        let p1t = CGPoint(x: 118, y: 29)
        let p2t = CGPoint(x: 175, y: 29)
        let upperArcCenter = CGPoint(x: 174, y: 44)
        let p3t = CGPoint(x: 118, y: 59)
        
        path.move(to: p1t)
        path.addLine(to: p2t)
        path.addArc(withCenter: upperArcCenter, radius: radius, startAngle: 3*endAngle, endAngle: endAngle, clockwise: true)
        path.addLine(to: p3t)
        path.addLine(to: p1t)
        path.close()
        
        let p1b = CGPoint(x: 118, y: 69)
        let p2b = CGPoint(x: 175, y: 69)
        let lowerArcCenter = CGPoint(x: 174, y: 84)
        let p3b = CGPoint(x: 118, y: 99)
        
        path.move(to: p1b)
        path.addLine(to: p2b)
        path.addArc(withCenter: lowerArcCenter, radius: radius, startAngle: 3*endAngle, endAngle: endAngle, clockwise: true)
        path.addLine(to: p3b)
        path.addLine(to: p1b)
        path.close()
        
        return path
    }
    
    func expandedGraySectionsPath() -> UIBezierPath {
        let path = UIBezierPath()
        let p1t = CGPoint(x: 117, y: 13)
        let p2t = CGPoint(x: 117, y: 29)
        let p3t = CGPoint(x: 117, y: 56)
        let p4t = CGPoint(x: 117, y: 43)
        
        path.move(to: p1t)
        path.addLine(to: p2t)
        path.addLine(to: p3t)
        path.addLine(to: p4t)
        path.addLine(to: p1t)
        path.close()
        
        let p1b = CGPoint(x: 117, y: 54)
        let p2b = CGPoint(x: 117, y: 69)
        let p3b = CGPoint(x: 117, y: 98)
        let p4b = CGPoint(x: 117, y: 83)
        
        path.move(to: p1b)
        path.addLine(to: p2b)
        path.addLine(to: p3b)
        path.addLine(to: p4b)
        path.addLine(to: p1b)
        path.close()
        
        return path
    }
    
    func expandAnimation() {
        let duration: CFTimeInterval = 1.0
        
        // Expands the black section in B
        let expandBShapeAnimation = CABasicAnimation(keyPath: "path")
        expandBShapeAnimation.duration = duration
        expandBShapeAnimation.fromValue = initialBPath().cgPath
        expandBShapeAnimation.toValue = expandedBPath().cgPath
        expandBShapeAnimation.fillMode = .forwards
        expandBShapeAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        expandBShapeAnimation.isRemovedOnCompletion = false
        bShapeLayer.add(expandBShapeAnimation, forKey: "expandBlackArea")
        
        // expands the holes in B
        let expandBHolesAnimation = CABasicAnimation(keyPath: "path")
        expandBHolesAnimation.duration = duration
        expandBHolesAnimation.fromValue = initialBHolesPath().cgPath
        expandBHolesAnimation.toValue = expandedBHolesPath().cgPath
        expandBHolesAnimation.fillMode = .forwards
        expandBHolesAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        expandBHolesAnimation.isRemovedOnCompletion = false
        bHolesShapeLayer.add(expandBHolesAnimation, forKey: "expandBHolesLOL")
        
        // expands the gray sections
        let expandGraySectionsAnimation = CABasicAnimation(keyPath: "path")
        expandGraySectionsAnimation.duration = duration
        expandGraySectionsAnimation.fromValue = initialGraySectionsPath().cgPath
        expandGraySectionsAnimation.toValue = expandedGraySectionsPath().cgPath
        expandGraySectionsAnimation.fillMode = .forwards
        expandGraySectionsAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        expandGraySectionsAnimation.isRemovedOnCompletion = false
        graySectionsLayer.add(expandGraySectionsAnimation, forKey: "expandGraySections")
    }
    
    func contractAnimation(completed:((Bool) -> Void)?) {
        let duration: CFTimeInterval = 1.0
        let beginTime =  CACurrentMediaTime() + 0.85
        
        CATransaction.begin()
        CATransaction.setCompletionBlock {
            completed?(true)
            self.removeAllAnimations()
        }
        
        // contracts the black section in B
        let contractBShapeAnimation = CABasicAnimation(keyPath: "path")
        contractBShapeAnimation.duration = duration
        contractBShapeAnimation.fromValue = expandedBPath().cgPath
        contractBShapeAnimation.toValue = initialBPath().cgPath
        contractBShapeAnimation.fillMode = .forwards
        contractBShapeAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeIn)
        contractBShapeAnimation.isRemovedOnCompletion = false
        contractBShapeAnimation.beginTime = beginTime
        bShapeLayer.add(contractBShapeAnimation, forKey: "contractBlackArea")
        
        // contracts the holes in B
        let contractBHolesAnimation = CABasicAnimation(keyPath: "path")
        contractBHolesAnimation.duration = duration
        contractBHolesAnimation.fromValue = expandedBHolesPath().cgPath
        contractBHolesAnimation.toValue = initialBHolesPath().cgPath
        contractBHolesAnimation.fillMode = .forwards
        contractBHolesAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeIn)
        contractBHolesAnimation.isRemovedOnCompletion = false
        contractBHolesAnimation.beginTime = beginTime
        bHolesShapeLayer.add(contractBHolesAnimation, forKey: "contractBHolesLOL")
        
        // contracts the gray sections
        let contractGraySectionsAnimation = CABasicAnimation(keyPath: "path")
        contractGraySectionsAnimation.duration = duration
        contractGraySectionsAnimation.fromValue =  expandedGraySectionsPath().cgPath
        contractGraySectionsAnimation.toValue = initialGraySectionsPath().cgPath
        contractGraySectionsAnimation.fillMode = .forwards
        contractGraySectionsAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeIn)
        contractGraySectionsAnimation.isRemovedOnCompletion = false
        contractGraySectionsAnimation.beginTime = beginTime
        graySectionsLayer.add(contractGraySectionsAnimation, forKey: "contractGraySections")
        CATransaction.commit()
    }
    
    func removeAllAnimations() {
        bShapeLayer.removeAllAnimations()
        bHolesShapeLayer.removeAllAnimations()
        graySectionsLayer.removeAllAnimations()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
