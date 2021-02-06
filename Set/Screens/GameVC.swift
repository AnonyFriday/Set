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
    @IBOutlet private weak var cardDeckContainerView : CardDeckContainerView! {
        didSet {
            /// Rotation Recognizer
            let rotation = UIRotationGestureRecognizer(target: self, action: #selector(gameVC(didTapObjectByGestureRecognizer:)))
            rotation.rotation = CGFloat.pi * 2
            cardDeckContainerView.addGestureRecognizer(rotation)
            
            /// Swipe Recognizer
            let swipe    = UISwipeGestureRecognizer(target: self, action: #selector(gameVC(didTapObjectByGestureRecognizer:)))
            swipe.direction = [.up]
            cardDeckContainerView.addGestureRecognizer(swipe)
        }
    }
    
    @IBOutlet private weak var scoreLabel: UILabel!
    @IBOutlet weak var drawThreeCardsLabel: UIButton!
    
    
    //MARK: View Controller Life Cycle
    override func viewDidLoad() {
        cardDeckContainerView.addCardViewToGrid(byAmount: 12)
        updateUIFromModel()
    }
    
    
    // MARK: Draw 3 Random Cards
    @IBAction func touchUpDrawThreeCards(_ sender: UIButton)
    {
        gameSet.drawThreeMoreCards()
        cardDeckContainerView.addCardViewToGrid(byAmount: 3)
        updateUIFromModel()
    }
    
    
    // MARK: Get New Game
    @IBAction func touchUpNewGame(_ sender: UIButton) {
        gameSet.makeNewGame()
        cardDeckContainerView.removeCardViewFromGrid()
        cardDeckContainerView.addCardViewToGrid(byAmount: 12)
        updateUIFromModel()
    }
    
    
    
    //MARK: Synchronize the View and Model
    fileprivate func updateUIFromModel()
    {
        
        // Update Score Label
        scoreLabel.text = "Score: \(gameSet.scorePoint)"
        
        
        // Update Cardview on Board
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
        
        // Update drawThreeCardsLabel
        gameSet.deckCards.totalCards.isEmpty
            ? (drawThreeCardsLabel.isEnabled = false)
            : (drawThreeCardsLabel.isEnabled = true)
        
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
    
    
    //MARK: Centerpoint function to recognize UIGestureRecognizer
    @objc func gameVC(didTapObjectByGestureRecognizer recognier: UIGestureRecognizer?)
    {
        /// Tap gesture
        switch recognier
        {
            case is UITapGestureRecognizer:
                if let cardView = recognier?.view as? CardView {
                    if cardDeckContainerView.cardViews.contains(cardView),
                       let index = cardDeckContainerView.cardViews.firstIndex(of: cardView),
                       let card  = gameSet.displayedCards[index]
                    {
                        gameSet.select(card: card)
                        updateUIFromModel()
                    }
                }
            case is UISwipeGestureRecognizer:
                gameSet.drawThreeMoreCards()
                cardDeckContainerView.addCardViewToGrid(byAmount: 3)
                updateUIFromModel()
            case is UIRotationGestureRecognizer: return
            default: return
        }
        
        
        
    }
}







