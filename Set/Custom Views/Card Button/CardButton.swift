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
    private var stackViewOfShapeViews : UIStackView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init() {
        self.init(frame: .zero)
        configureShapeViews()
    }
    

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()

        stackViewOfShapeViews.frame = bounds
        stackViewOfShapeViews.spacing = bounds.height / 16
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

struct Constants {
    static let marginRatio: CGFloat = 0.0625
    static let strokeRatio: CGFloat = 0.01
    static let cornerRadiusRatio: CGFloat = 0.25
}
