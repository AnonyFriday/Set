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
        cardDeckContainerView.addCardViewToGrid(byAmount: 42)
        synchrounizeButtonCards(fromCards: gameSet.displayedCards, applyToCardViews: &cardDeckContainerView.cardViews)
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
        
        for index in gameSet.displayedCards.indices {
            print("\n\n",gameSet.displayedCards,"\n\n")
            var (card, cardView) = (gameSet.displayedCards[index], cardDeckContainerView.cardViews[index])
            
            setCardView(cardView: &cardView, by: card)
        }
    }
    
    //MARK: Synchronize the View and Model
    fileprivate func synchrounizeButtonCards(fromCards cards: [Card?], applyToCardViews cardViews: inout [CardView])
    {
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




