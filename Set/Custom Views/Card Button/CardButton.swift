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

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .gray
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func draw(_ rect: CGRect) {
        
        var shapes = [ShapeView]()
        for _ in 0..<numberOfShape!.rawValue {
            let newShape = ShapeView(frame: frame)
            newShape.color = .two
            newShape.shading = .three
            newShape.symbolShape = .one
            newShape.isOpaque = false
            shapes.append(newShape)
        }
        
        let stack = UIStackView(arrangedSubviews: shapes)
                stack.translatesAutoresizingMaskIntoConstraints = false
                
                stack.axis = .vertical
                stack.spacing = frame.height/16
                stack.distribution = .fillEqually
                addSubview(stack)
                // constrains
                stack.leftAnchor.constraint(equalTo: leftAnchor, constant: frame.width * Constants.marginRatio).isActive = true
                stack.rightAnchor.constraint(equalTo: rightAnchor, constant: -frame.width * Constants.marginRatio).isActive = true
                stack.heightAnchor.constraint(equalToConstant: frame.height * CGFloat(shapes.count) / 3 - frame.height * Constants.marginRatio).isActive = true
                stack.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        

        
    }
    
}

struct Constants {
    static let marginRatio: CGFloat = 0.0625
    static let strokeRatio: CGFloat = 0.01
    static let cornerRadiusRatio: CGFloat = 0.25
}
