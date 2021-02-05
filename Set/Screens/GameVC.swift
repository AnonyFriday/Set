//
//  GameVC.swift
//  Set
//
//  Created by Vu Kim Duy on 22/1/21.
//

import UIKit


class GameVC : UIViewController
{
    // MARK: Start to play the game - Model
    lazy private var gameSet = GameSet()
    
    // MARK: Interface Builder - View
    @IBOutlet private weak var cardDeckContainerView : CardDeckContainerView!
    @IBOutlet private weak var scoreLabel: UILabel!
    @IBOutlet weak var drawThreeCardsLabel: UIButton!
    
    override func viewDidLoad() {
        initialSetup()
        updateUIFromModel()
    }
    
    @objc func touchUpButtonCard() {
        print("Hello")
    }
    
    
    //
    //    @IBAction func touchUpDrawThreeCards(_ sender: UIButton)
    //    {
    //        gameSet?.drawThreeMoreCards()
    //        updateUIFromModel()
    //    }
    //
    //    @IBAction func touchUpNewGame(_ sender: UIButton) {
    //        gameSet?.makeNewGame()
    //        updateUIFromModel()
    //    }
    //
    //    @IBAction func touchUpButtonCard(_ sender: UIButton)
    //    {
    //        guard let index = customButtonCard.firstIndex(of: sender),
    //              let card = gameSet?.displayedCards[index]
    //        else { return }
    //        gameSet!.select(card: card) // we got the selectedCard
    //        updateUIFromModel()
    //    }
    //
    //
    
    
    
    
    
    
    
    //MARK: Update UI From Model
    func updateUIFromModel()
    {
        scoreLabel.text = "Score: \(gameSet.scorePoint)"
        
        // Updated UI when User select Card
        // Synchronize Card with Card View
        
        for index in gameSet.displayedCards.indices {
            let (card, cardView) = (gameSet.displayedCards[index], cardDeckContainerView.cardViews[index])
            
            guard let notNilCard = card else {
                cardView.isHidden = true
                return
            }
            
            print(gameSet.selectedCards)
            
            if gameSet.selectedCards.contains(notNilCard) {
                cardView.layer.borderColor = UIColor.systemRed.cgColor
                cardView.layer.borderWidth = 10
            } else {
                cardView.layer.borderColor = UIColor.clear.cgColor
            }
        }
        
        
    }
    
    
    fileprivate func initialSetup() {
        cardDeckContainerView.addCardViewToGrid(byAmount: 12)
        synchrounizeButtonCards(fromCards: gameSet.displayedCards, applyToCardViews: &cardDeckContainerView.cardViews)
    }
    
    
    
    //MARK: Synchronize the View and Model
    fileprivate func synchrounizeButtonCards(fromCards cards: [Card?], applyToCardViews cardViews: inout [CardView])
    {
        assert(cards.count == cardViews.count, "Both number of elements of each array has to be equal")
        
        var index = 0
        while index < cards.count && index < cardViews.count {
          
            cardViews[index].color          =  cards[index]?.color
            cardViews[index].numberOfShape  =  cards[index]?.quantity
            cardViews[index].symbolShape    =  cards[index]?.shape
            cardViews[index].shading        =  cards[index]?.shading
            
            // Add Tap Gesture to each View
            let tap = UITapGestureRecognizer(target: self, action: #selector(gameVC(didTapObjectByGestureRecognizer:)))
            cardViews[index].addGestureRecognizer(tap)
            index += 1
        }
    }
    
    
    //MARK: Select Card
    @objc func gameVC(didTapObjectByGestureRecognizer recognier: UIGestureRecognizer?)
    {
        if let cardView = (recognier as? UITapGestureRecognizer)?.view as? CardView
        {
            if cardDeckContainerView.cardViews.contains(cardView),
               let index = cardDeckContainerView.cardViews.firstIndex(of: cardView),
               let card  = gameSet.displayedCards[index]
            {
                gameSet.select(card: card)
                updateUIFromModel()
            }
        }
    }
    
}



//
//
//    //MARK: Configure Collection Buttons
//    func configureCollectionButtons()
//    {
//        for button in customButtonCard
//        {
//            button.setAttributedTitle(NSAttributedString(string: ""), for: .normal)
//            button.isEnabled = false
//            button.layer.backgroundColor = UIColor.clear.cgColor
//            button.layer.cornerRadius    = 10
//        }
//
//        for index in gameSet!.displayedCards.indices
//        {
//            let (button, card) = (customButtonCard[index], gameSet!.displayedCards[index])
//            if gameSet!.displayedCards.contains(card)
//            {
//                button.setButton(with: card)
//                button.isEnabled = true
//                button.backgroundColor = .white
//                button.layer.borderColor = gameSet!.selectedCards.contains(card) ? UIColor.systemRed.cgColor : UIColor.clear.cgColor
//                button.layer.borderWidth = 8
//            }
//        }
//    }




