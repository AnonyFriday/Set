//
//  CardDeck.swift
//  Set
//
//  Created by Vu Kim Duy on 22/1/21.
//

import Foundation

class CardDeck {
    
    private(set) var cardDeck = [Card]()
    
    init() {
        for quantity in Attribute.allCases {
            for color in Attribute.allCases {
                for shading in Attribute.allCases {
                    for shape in Attribute.allCases {
                        let card = Card(color: color, shape: shape, shading: shading, quantity: quantity)
                        cardDeck.append(card)
                    }
                }
            }
        }
    }
    
    // Draw card from the cards deck
    func drawRandomCard() -> Card? {
        guard cardDeck.count > 0 else {
            return nil
        }
        return cardDeck.remove(at: cardDeck.count.arc4random)
    }
}
