//
//  CardDeckContainerView.swift
//  Set
//
//  Created by Vu Kim Duy on 3/2/21.
//

import UIKit

class CardDeckContainerView: UIView {
    
    private var cardButton: CardButton = CardButton()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        backgroundColor = .brown
        
        cardButton.frame = self.bounds
        
        addSubview(cardButton)
        
    
        
    }
    
    //MARK: Draw the View
    override func draw(_ rect: CGRect) {
        
    }
    
    
}
