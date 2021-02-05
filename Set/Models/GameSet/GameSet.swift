//
//  GameSet.swift
//  Set
//
//  Created by Vu Kim Duy on 20/1/21.
//

import Foundation

//MARK: Checkable
protocol Checkable {
    var scorePoint : Int { get }
    func checkIfMakeSet(of cards: [Card]) -> Bool
}


//MARK: Class
class GameSet: Checkable
{
    
    //MARK: Variables
    private(set) var scorePoint: Int = 0
    private(set) var deckCards = CardDeck()
    private(set) var selectedCards = [Card]()
    private(set) var displayedCards = [Card?]()
    
    
    //MARK: Initializer
    required init()
    {
        setDisplayCard(with: 42)
    }
    
    
    //MARK: Select Card
    func select(card: Card)
    {
        guard !selectedCards.contains(card) else {
            selectedCards.remove(at: selectedCards.firstIndex(of: card)!)
            scorePoint -= 1
            return
        }
        
        selectedCards.append(card)
 
        if selectedCards.count == 3 {
            if checkIfMakeSet(of: selectedCards) {

                displayedCards = displayedCards.map {
                    guard let card = $0 else { return nil }
                    return selectedCards.contains(card) ? deckCards.drawRandomCard() : $0
                }
                scorePoint += 5
            } else {
                scorePoint -= 3
            }
            
            selectedCards.removeAll()
        }
    }
    
    
    //MARK: Set Display Card
    func setDisplayCard(with quanttity: Int) {
        for _ in 0...(quanttity - 1){
            displayedCards.append(deckCards.drawRandomCard()!)
        }
    }
    
    
    //MARK: Create New Game
    func makeNewGame() {
        selectedCards.removeAll()
        displayedCards.removeAll()
        deckCards.setTotalCards()
        setDisplayCard(with: 12)
        scorePoint = 0
    }
    
    
    //MARK: Draw more 3 cards
    func drawThreeMoreCards() {
        setDisplayCard(with: 3)
    }
}

//MARK: Extension
extension Checkable
{
    func checkIfMakeSet(of cards: [Card]) -> Bool{
        let (c1,c2,c3) = (cards[0], cards[1], cards[2])
        for selector in Card.allSelectors {
            let cardAttrs = [c1,c2,c3].map({selector($0)})
            if !cardAttrs.isAllSameOrAllDifference { return false }
        }
        return true
    }
}



extension Array where Element: Hashable{
    func difference(from other: [Element]) -> [Element] {
        let thisSet = Set(self)
        let otherSet = Set(other)
        return Array(thisSet.symmetricDifference(otherSet))
    }
}
