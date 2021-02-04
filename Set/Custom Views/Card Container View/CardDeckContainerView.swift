//
//  CardDeckContainerView.swift
//  Set
//
//  Created by Vu Kim Duy on 3/2/21.
//

import UIKit

class CardDeckContainerView: UIView {
    
    var cardButtons = [CardButton]()
    private(set) var grid        : Grid = Grid(layout: .aspectRatio(4/5))
    
    
    //MARK: View Life Cycle
    override func layoutSubviews() {
        super.layoutSubviews()
        configureCardButtons()
    }
    
    
    fileprivate func configureCardButtons() {
        grid.frame = bounds.inset(by: UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20))
        
        for (index, button) in cardButtons.enumerated() {
            if let frame = grid[index] {
                button.frame    = frame.insetBy(dx: bounds.width * 0.025, dy: bounds.height * 0.025)
                button.layer.borderWidth = 1
                button.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
                button.backgroundColor   = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
                button.layer.cornerRadius = 10
            }
        }
    }
    
    
    //MARK: Add Card To Grid
    func addCardButtonToGrid(byAmount amount: Int = 3) {
        
        // Map those button with its initializer
        let amountButtons = (0..<amount).map { _ in CardButton() }
        print(amountButtons[1])
        for button in amountButtons {
            addSubview(button)
        }
        
        cardButtons     += amountButtons
        grid.cellCount   = cardButtons.count
        setNeedsLayout() // update Layout
    }
}




