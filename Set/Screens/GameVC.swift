//
//  GameVC.swift
//  Set
//
//  Created by Vu Kim Duy on 22/1/21.
//

import UIKit

class GameVC : UIViewController
{
    
    lazy var gameSet = GameSet(numberOfCardToStart: 12)
    
    @IBOutlet private weak var cardDeckContainerView: CardDeckContainerView!
    
    
    override func viewDidLoad() {
        gameSet?.setDisplayCard(with: 12)
        cardDeckContainerView.addCardButtonToGrid(byAmount: 12)
        //        updateUIFromModel()
    }
    

    // MARK: Interface Builder
//    @IBOutlet private var customButtonCard: [UIButton]!
    @IBOutlet private weak var scoreLabel: UILabel!
    @IBOutlet weak var drawThreeCardsLabel: UIButton!

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
//    //MARK: Update UI From Model
//    func updateUIFromModel()
//    {
//        scoreLabel.text = "Score: \(gameSet!.scorePoint)"
//        configureCollectionButtons()
//        gameSet?.displayedCards.count == customButtonCard.count ? (drawThreeCardsLabel.isEnabled = false) : (drawThreeCardsLabel.isEnabled = true)
//    }
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
