//
//  CardDeck.swift
//  Set
//
//  Created by Vu Kim Duy on 22/1/21.
//

import Foundation

//MARK: Class
class CardDeck
{
    
    var totalCards = [Card]()
    
    //MARK: Initialier
    init() {
        setTotalCards()
    }
    
    
    //MARK: Draw card from the cards deck
    func drawRandomCard() -> Card? {
        guard totalCards.count > 0 else {
            return nil
        }
        return totalCards.remove(at: totalCards.count.arc4random)
    }
    
    
    //MARK: Set Total Cards
    func setTotalCards() {
        totalCards.removeAll()
        
        for quantity in Attribute.allCases {
            for color in Attribute.allCases {
                for shading in Attribute.allCases {
                    for shape in Attribute.allCases {
                        let card = Card(color: color, shape: shape, shading: shading, quantity: quantity)
                        totalCards.append(card)
                    }
                }
            }
        }
    }
}
