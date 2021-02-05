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
        cardDeckContainerView.addCardViewToGrid(byAmount: 12)
        synchrounizeButtonCards()
    }
    

    
        @IBAction func touchUpDrawThreeCards(_ sender: UIButton)
        {
            gameSet.drawThreeMoreCards()
            cardDeckContainerView.addCardViewToGrid(byAmount: 3)
            synchrounizeButtonCards()
        }
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
    
    //MARK: Synchronize the View and Model
    fileprivate func synchrounizeButtonCards()
    {
        scoreLabel.text = "Score: \(gameSet.scorePoint)"
        
        let cards = gameSet.displayedCards
        let cardViews = cardDeckContainerView.cardViews
        assert(cards.count == cardViews.count, "Both number of elements of each array has to be equal")
        
        var index = 0
        while index < cards.count && index < cardViews.count {
          
            let card = cards[index]
            var cardView = cardViews[index]
            
            setCardView(cardView: &cardView, by: card)
            
            // Add Tap Gesture to each View
            let tap = UITapGestureRecognizer(target: self, action: #selector(gameVC(didTapObjectByGestureRecognizer:)))
            cardViews[index].addGestureRecognizer(tap)
            index += 1
        }
        
        if gameSet.deckCards.totalCards.isEmpty {
            drawThreeCardsLabel.isEnabled = false
        }
    }
    
    
    fileprivate func setCardView( cardView: inout CardView, by card: Card?)
    {
        guard let card = card else {
            cardView.removeFromSuperview()
            return
        }
        
        cardView.color          = card.color
        cardView.symbolShape    = card.shape
        cardView.shading        = card.shading
        cardView.numberOfShape  = card.quantity
        
        if gameSet.selectedCards.contains(card) {
            cardView.layer.borderColor = UIColor.systemRed.cgColor
            cardView.layer.borderWidth = 5
        } else {
            cardView.layer.borderColor = UIColor.clear.cgColor
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
                synchrounizeButtonCards()
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




