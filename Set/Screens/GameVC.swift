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
        updateUIFromModel()
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
        cardDeckContainerView.addCardButtonToGrid(byAmount: 2)
        
        synchrounizeButtonCards(fromCards: gameSet!.displayedCards, applyToButtonCards: &cardDeckContainerView.cardButtons)
   
    }
    
    
    fileprivate func synchrounizeButtonCards(fromCards cards: [Card], applyToButtonCards buttonCards: inout [CardButton]){

        var index = 0
        
        while index < cards.count && index < buttonCards.count {
            buttonCards[index].color          =  cards[index].color
            buttonCards[index].numberOfShape  =  cards[index].quantity
            buttonCards[index].symbolShape    =  cards[index].shape
            buttonCards[index].shading        =  cards[index].shading
            index += 1
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
}
