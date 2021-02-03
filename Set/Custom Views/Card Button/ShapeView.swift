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
        let path: UIBezierPath
        
        
        // Draw Pattern
        switch symbolShape {
        case .one:      /**Diamond*/
            path = UIBezierPath()
            path.move(to: CGPoint(x: 0, y: bounds.midY))
            path.addLine(to: CGPoint(x: bounds.midX, y: 0))
            path.addLine(to: CGPoint(x: bounds.maxX, y: bounds.midY))
            path.addLine(to: CGPoint(x: bounds.midX, y: bounds.maxY))
            path.close()
        case .two:      /**Oval*/
            path = .init(ovalIn: bounds)
        case .three:    /**Triangle*/
            path = UIBezierPath()
            path.move(to: CGPoint(x: 0, y: bounds.midY))
            path.addLine(to: CGPoint(x: bounds.width / 2, y: 0))
            path.addLine(to: CGPoint(x: bounds.width, y: bounds.height/2))
            path.close()
        case .none:
            path = UIBezierPath()
        }
    
        
        // Color
        switch color {
        case .one: /** Blue */
            UIColor.systemBlue.setFill()
            UIColor.systemBlue.setStroke()
        case .two: /** Red */
            UIColor.systemRed.setFill()
            UIColor.systemRed.setStroke()
        case .three: /** Green*/
            UIColor.systemGreen.setFill()
            UIColor.systemGreen.setStroke()
        case .none: break
        }
        
        
        // Shadding
        switch shading {
        case .one:  /**Empty*/
            path.stroke()
        case .two:  /**Fill*/
            path.fill()
        case .three: /**Striped*/
            let stripe = UIBezierPath()
            var currentX : CGFloat = 0

            while currentX < bounds.width {
                stripe.move(to: CGPoint(x: currentX, y: 0))
                stripe.addLine(to: CGPoint(x: currentX, y: bounds.size.height))
                currentX *= ( 0.03 * bounds.size.width )
            }
            stripe.lineWidth = 0.005 * frame.size.width
            
            stripe.stroke()
            path.stroke()
            
        case .none: break
        }
        
    }
    
}
