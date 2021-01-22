//
//  GameSet.swift
//  Set
//
//  Created by Vu Kim Duy on 20/1/21.
//

import Foundation


class GameSet {
    private(set) var cardDeck = CardDeck()
    private(set) var selectedCards = [Card]()
    private(set) var displayedCards = [Card]()
    
    init(numberOfCardToStart: Int) {
        for _ in 1...numberOfCardToStart {
            displayedCards.append(cardDeck.drawRandomCard()!)
        }
    }
    
    // Select Card and check
    func select(card: Card) {
        
    }
    
    func checkIfMakeSet() -> Bool {
        
    }
    
}
