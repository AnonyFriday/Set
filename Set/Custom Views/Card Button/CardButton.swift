//
//  cardButton.swift
//  Set
//
//  Created by Vu Kim Duy on 3/2/21.
//

import UIKit

@IBDesignable
class CardButton: UIButton
{
    //MARK: Initializer
    private var numberOfShape : Attribute?  = .three { didSet {setNeedsDisplay()}}
    private var color : Attribute?          = .three { didSet {setNeedsDisplay()}}
    private var shading : Attribute?        = .three { didSet {setNeedsDisplay()}}
    private var symbolShape : Attribute?    = .three { didSet {setNeedsDisplay()}}
    private var stackViewOfShapeViews : UIStackView!
    
    
    //MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureShapeViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: Layout Subviews
    override func layoutSubviews() {
        super.layoutSubviews()
        stackViewOfShapeViews.frame = bounds.insetBy(dx: stackViewInsetByDx, dy: stackViewInsetByDy)
    }
    
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        setNeedsLayout()
    }
    

    //MARK: Configure ShapeViews
    fileprivate func configureShapeViews() {
        var shapes = [ShapeView]()
        for _ in 0..<numberOfShape!.rawValue {
            let newShape            = ShapeView()
            newShape.color          = color
            newShape.shading        = shading
            newShape.symbolShape    = symbolShape
            newShape.isOpaque       = false
//            newShape.contentMode    = .scaleAspectFit
            shapes.append(newShape)
        }
        
        stackViewOfShapeViews = UIStackView(arrangedSubviews: shapes)
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


