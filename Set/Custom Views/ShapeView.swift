//
//  ShapeView.swift
//  Set
//
//  Created by Vu Kim Duy on 3/2/21.
//

import UIKit

class ShapeView: UIView {
    
    var color           : Attribute! { didSet {setNeedsDisplay()}}
    var symbolShape     : Attribute! { didSet {setNeedsDisplay()}}
    var shading         : Attribute! { didSet {setNeedsDisplay()}}
    
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath()
        // Draw Pattern
        
        path.move(to: CGPoint(x: 0, y: bounds.midY))
        path.addLine(to: CGPoint(x: bounds.midX, y: 0))
        path.addLine(to: CGPoint(x: bounds.maxX, y: bounds.midY))
        path.addLine(to: CGPoint(x: bounds.midX, y: bounds.maxY))
        path.close()

        UIColor.blue.setFill()
        UIColor.white.setStroke()
        path.stroke()
        path.fill()
        
        // Shadding
        switch shading {
        case .one:
            path.stroke()
        case .two:
            path.fill()
        case .three:
            let stripe = UIBezierPath()
            var currentX : CGFloat = 0

            while currentX < frame.size.width {
                stripe.move(to: CGPoint(x: currentX, y: 0))
                stripe.addLine(to: CGPoint(x: currentX, y: frame.size.height))
                currentX *= ( 0.03 * frame.size.width )
            }
            stripe.lineWidth = 0.005 * frame.size.width

            path.stroke()
            stripe.stroke()
        case .none:
            break
        }

        // Color
        switch color {
        case .one:
            UIColor.systemBlue.setFill()
            UIColor.systemBlue.setStroke()
        case .two:
            UIColor.systemRed.setFill()
            UIColor.systemRed.setStroke()
        case .three:
            UIColor.systemGreen.setFill()
            UIColor.systemGreen.setStroke()

        case .none:
            break
        }
        
    }
    
}
