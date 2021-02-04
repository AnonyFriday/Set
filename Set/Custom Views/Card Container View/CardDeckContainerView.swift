//
//  CardDeckContainerView.swift
//  Set
//
//  Created by Vu Kim Duy on 3/2/21.
//

import UIKit

class CardDeckContainerView: UIView {
    
    private(set) var cardButtons = [CardButton]()
    private(set) var grid        : Grid = Grid(layout: .aspectRatio(3/2))
    
    private var centeredRect: CGRect {
        get {
          return CGRect(x: bounds.size.width * 0.025,
                        y: bounds.size.height * 0.025,
                        width: bounds.size.width * 0.95,
                        height: bounds.size.height * 0.95)
        }
      }
    
    
    //MARK: View Life Cycle
    override func layoutSubviews() {
        super.layoutSubviews()
        grid.frame = centeredRect
        
        for (index, button) in cardButtons.enumerated() {
            if let frame = grid[index] {
                button.frame    = frame
                button.layer.borderWidth = 0.4
                button.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
                button.backgroundColor   = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
                button.layer.cornerRadius = 0.55
            }
        }
    }
    
    
    //MARK: Add Card To Grid
    func addCardButtonToGrid(byAmount amount: Int = 3) {
        
        // Map those button with its initializer
        let amountButtons = (0..<amount).map { _ in CardButton() }
        
        for button in amountButtons {
            addSubview(button)
        }
        
        cardButtons     += amountButtons
        grid.cellCount   = cardButtons.count
        print(grid.frame)
        print()
        setNeedsLayout()
    }
    
}

extension UIView {
    func addSubviews(views: UIView...) {
        for view in views { addSubview(view)}
    }
    
    func removeViewsFromSubView(views: UIView) {
        
    }
}
