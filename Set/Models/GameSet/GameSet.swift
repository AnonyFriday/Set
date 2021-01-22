//
//  GameSet.swift
//  Set
//
//  Created by Vu Kim Duy on 20/1/21.
//

import Foundation

protocol Checkable {
    func checkIfMakeSet(of cards: [Card]) -> Bool
}

class GameSet
{
    private(set) var cardDeck = CardDeck()
    private(set) var selectedCards = [Card]()
    private(set) var displayedCards = [Card]()
    
    
    init(numberOfCardToStart: Int) {
        for _ in 1...numberOfCardToStart {
            displayedCards.append(cardDeck.drawRandomCard()!)
        }
    }
    

    func select(card: Card) {
        
        // Check the set is the selectedCards equals to 3
        guard selectedCards.count != 3 else {
            if !checkIfMakeSet(of: selectedCards) {
                print("That is a set")
            }
            selectedCards.removeAll()
            return
        }
        
        // Deselecting the already existed Card
        if selectedCards.contains(card) {
            selectedCards.remove(at: selectedCards.firstIndex(of: card)!)
        }
        
        selectedCards.append(card)
    }
}


extension GameSet: Checkable {
    func checkIfMakeSet(of cards: [Card]) -> Bool{
        var (c1,c2,c3) = (cards[0], cards[1], cards[2])
        for selector in Card.allSelectors {
            let cardAttrs = [c1,c2,c3].map({selector($0)})
            if !cardAttrs.isAllSameOrAllDifference { return false }
        }
        return true
    }
}


