//
//  CardDeckContainerView.swift
//  Set
//
//  Created by Vu Kim Duy on 3/2/21.
//

import UIKit

class CardDeckContainerView: UIView {
    
    var cardViews                  = [CardView]()
    private var grid        : Grid = Grid(layout: .aspectRatio(4/5))
    
    //MARK: View Life Cycle
    override func layoutSubviews() {
        super.layoutSubviews()
        configureCardViews()
    }
    
    
    fileprivate func configureCardViews() {
        grid.frame = bounds.inset(by: UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20))

        for (index, cardView) in cardViews.enumerated() {
            if let cardViewFrame = grid[index] {
                cardView.frame             = cardViewFrame.inset(by: UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4))
                cardView.backgroundColor   = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
                cardView.layer.cornerRadius = 10
                cardView.clipsToBounds      = true
            }
        }
    }
    
    
    //MARK: Insert Card To Grid
    func addCardViewToGrid(byAmount amount: Int = 3) {
        
        // Map those button with its initializer
        let amountCardViews = (0..<amount).map { _ in CardView() }
        for cardView in amountCardViews {
            addSubview(cardView)
        }
        
        cardViews     += amountCardViews
        grid.cellCount   = cardViews.count
        setNeedsLayout() // update Layout
    }
    
    
    //MARK: Remove Card From Grid
    /// If game is reset to the newgame
    func removeCardViewFromGrid(){
        for cardView in cardViews {
            cardView.removeFromSuperview()
        }
        cardViews.removeAll()
        grid.cellCount = 0
        setNeedsLayout()
        
    }
}




