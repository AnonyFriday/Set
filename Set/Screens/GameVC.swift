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
    
    private var selectedCardViews : [CardView] = [CardView]()
    
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
    
    
    
    //MARK: Synchronize the View and Model
    
    
    func updateUIFromModel()
    {
        scoreLabel.text = "Score: \(gameSet!.scorePoint)"
        
        for card in cardDeckContainerView.cardViews {
            if selectedCardViews.contains(card) {
                card.layer.borderWidth = 2
                card.layer.borderColor = #colorLiteral(red: 0.4392156899, green: 0.01176470611, blue: 0.1921568662, alpha: 1)
                selectedCardViews.remove(at: selectedCardViews.firstIndex(of: card)!)
            } else {
                card.layer.borderWidth = 0
            }
        }
        
    }
    
    
    fileprivate func initialSetup() {
        cardDeckContainerView.addCardViewToGrid(byAmount: 12)
        synchrounizeButtonCards(fromCards: gameSet!.displayedCards, applyToCardViews: &cardDeckContainerView.cardViews)
    }
    
    
    fileprivate func synchrounizeButtonCards(fromCards cards: [Card], applyToCardViews cardViews: inout [CardView])
    {
        var index = 0
        while index < cards.count && index < cardViews.count {
            cardViews[index].color          =  cards[index].color
            cardViews[index].numberOfShape  =  cards[index].quantity
            cardViews[index].symbolShape    =  cards[index].shape
            cardViews[index].shading        =  cards[index].shading
            
            // Add Tap Gesture to each View
            let tap = UITapGestureRecognizer(target: self, action: #selector(gameVC(didTapObjectByGestureRecognizer:)))
            cardViews[index].addGestureRecognizer(tap)
            index += 1
        }
    }
    
    @objc func gameVC(didTapObjectByGestureRecognizer recognier: UIGestureRecognizer?)
    {
        if let cardView = (recognier as? UITapGestureRecognizer)?.view as? CardView
        {
            if cardDeckContainerView.cardViews.contains(cardView),
               let index = cardDeckContainerView.cardViews.firstIndex(of: cardView),
               let card  = gameSet?.displayedCards[index]
            {
                gameSet?.select(card: card)
                selectedCardViews.append(cardView)
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




