//
//  cardButton.swift
//  Set
//
//  Created by Vu Kim Duy on 3/2/21.
//

import UIKit

@IBDesignable
class CardView: UIView
{
    //MARK: Properties
    var numberOfShape : Attribute!  = .one { didSet {setNeedsDisplay()}}
    var color : Attribute!          = .one { didSet {setNeedsDisplay()}}
    var shading : Attribute!        = .one { didSet {setNeedsDisplay()}}
    var symbolShape : Attribute!    = .one { didSet {setNeedsDisplay()}}
        
    var shapes : [ShapeView]! {
        var currentShapes = [ShapeView]()
        for _ in 0..<numberOfShape!.rawValue {
            let newShape            = ShapeView()
            newShape.color          = color
            newShape.shading        = shading
            newShape.symbolShape    = symbolShape
            newShape.isOpaque       = false
            newShape.contentMode    = .redraw
            newShape.setNeedsLayout()
            currentShapes.append(newShape)
        }
        return currentShapes

    }
    
    private lazy var stack = UIStackView(arrangedSubviews: shapes)
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        setNeedsDisplay()
    }
    
    
    override func draw(_ rect: CGRect) {
        print("Yess")
        stack.removeFromSuperview()
        
        stack = UIStackView(arrangedSubviews: shapes)
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        stack.axis = .vertical
        stack.spacing = frame.height/20
        stack.distribution = .fillEqually
        addSubview(stack)
        
        // constrains
        NSLayoutConstraint.activate([
            stack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -frame.width * 0.2),
            stack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: frame.width * 0.2),
            stack.heightAnchor.constraint(equalToConstant: bounds.height * CGFloat(shapes.count) / 3 - bounds.height * 0.2),
            stack.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
    
    
    //MARK: Configure ShapeViews
    fileprivate func configureShapeViews() {

        
    }
}

//MARK: Extension
extension CardView {
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

extension UIStackView {
    func addArrangedSubviews(views: [UIView]) {
        for view in views {
            self.addArrangedSubview(view)
        }
        
    }
    
    func removeArrangedSubviews(views: [UIView]) {
        for view in views {
            self.removeArrangedSubview(view)
        }
        
    }
}

