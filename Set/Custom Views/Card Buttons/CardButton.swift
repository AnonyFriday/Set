//
//  cardButton.swift
//  Set
//
//  Created by Vu Kim Duy on 3/2/21.
//

import UIKit

class CardButton: UIButton
{
    private var numberOfShape : Attribute? = .three { didSet {setNeedsDisplay()}}

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func draw(_ rect: CGRect) {
        
        var shapes = [ShapeView]()
        for _ in 0..<numberOfShape!.rawValue {
            let newShape = ShapeView(frame: bounds)
            newShape.color = .one
            newShape.shading = .two
            newShape.symbolShape = .one
            newShape.isOpaque = false
            shapes.append(newShape)
        }

        let stackView = UIStackView(arrangedSubviews: shapes)
        stackView.alignment = .center
        stackView.axis      = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing   = bounds.height * 0.1
        stackView.frame     = bounds
        print(stackView)
        addSubview(stackView)

        
    }
    
    
    
}
