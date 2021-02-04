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
    private var numberOfShape : Attribute? = .three { didSet {setNeedsDisplay()}}
    private var color : Attribute? = .three { didSet {setNeedsDisplay()}}
    private var shading : Attribute? = .three { didSet {setNeedsDisplay()}}
    private var symbolShape : Attribute? = .three { didSet {setNeedsDisplay()}}
    private var stack : UIStackView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .gray
        configureShapeViews()
    }
    
//    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
//
//    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        stack.frame = bounds
    }

    fileprivate func configureShapeViews() {
        var shapes = [ShapeView]()
        for _ in 0..<numberOfShape!.rawValue {
            let newShape = ShapeView(frame: frame)
            newShape.color = color
            newShape.shading = shading
            newShape.symbolShape = symbolShape
            newShape.isOpaque = false
            newShape.contentMode    = .scaleAspectFit
            shapes.append(newShape)
        }
        
        stack = UIStackView(arrangedSubviews: shapes)
        stack.axis = .vertical
        stack.spacing = stack.bounds.height/16
        stack.distribution = .fillEqually
        addSubview(stack)
    }
    
}

struct Constants {
    static let marginRatio: CGFloat = 0.0625
    static let strokeRatio: CGFloat = 0.01
    static let cornerRadiusRatio: CGFloat = 0.25
}
