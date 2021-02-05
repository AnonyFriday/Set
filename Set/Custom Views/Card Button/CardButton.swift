//
//  cardButton.swift
//  Set
//
//  Created by Vu Kim Duy on 3/2/21.
//

import UIKit

@IBDesignable
class CardButton: UIView
{
    //MARK: Properties
    var numberOfShape : Attribute!  = .one { didSet {setNeedsDisplay()}}
    var color : Attribute!          = .one { didSet {setNeedsDisplay()}}
    var shading : Attribute!        = .one { didSet {setNeedsDisplay()}}
    var symbolShape : Attribute!    = .one { didSet {setNeedsDisplay()}}
        
    var shapes : [ShapeView]! {
        var shapes = [ShapeView]()
        for _ in 0..<numberOfShape!.rawValue {
            let newShape            = ShapeView()
            newShape.color          = color
            newShape.shading        = shading
            newShape.symbolShape    = symbolShape
            newShape.isOpaque       = false
            shapes.append(newShape)
        }
        return shapes
    }

    private lazy var stackViewOfShapeViews = UIStackView(arrangedSubviews: shapes)

    
    //MARK: Layout Subviews
    override func layoutSubviews() {
        super.layoutSubviews()
        configureShapeViews()
    }
    
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        setNeedsLayout()
        setNeedsDisplay()
    }
    
    
    //MARK: Configure ShapeViews
    fileprivate func configureShapeViews() {
        stackViewOfShapeViews.removeFromSuperview()
        stackViewOfShapeViews.frame = bounds.insetBy(dx: stackViewInsetByDx, dy: stackViewInsetByDy)
        stackViewOfShapeViews.axis = .vertical
        stackViewOfShapeViews.distribution = .fillEqually
        stackViewOfShapeViews.contentMode  = .scaleAspectFit //TODO: Change the scale ratio of the stack view
        addSubview(stackViewOfShapeViews)
    }
    
    
    

}

//MARK: Extension
extension CardButton {
    enum ScreenRatio {
        static let stackViewInsetByDxRatio: CGFloat = 0.1
        static let stackViewInsetByDyRatio: CGFloat = 0.1
    }
    
    var stackViewInsetByDx: CGFloat {
        bounds.width * ScreenRatio.stackViewInsetByDxRatio
    }
    
    var stackViewInsetByDy: CGFloat {
        bounds.height * ScreenRatio.stackViewInsetByDxRatio
    }
}


