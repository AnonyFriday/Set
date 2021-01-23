//
//  GameVC.swift
//  Set
//
//  Created by Vu Kim Duy on 22/1/21.
//

import UIKit

class GameVC : UIViewController {
    
    lazy var gameSet = GameSet(numberOfCardToStart: 12)
    
    override func viewDidLoad() {
        updateUIFromModel()
    }
    
    
    // MARK: Interface Builder
    @IBOutlet private var customButtonCard: [UIButton]!
    @IBOutlet private weak var scoreLabel: UILabel!
    
    @IBAction func touchUpNewGame(_ sender: UIButton) {
        
    }
    
    @IBAction func touchUpButtonCard(_ sender: UIButton) {
        guard let index = customButtonCard.firstIndex(of: sender) else {
            return
        }
        let card = gameSet.displayedCards[index]
        gameSet.select(card: card) // we got the selectedCard
        updateUIFromModel()
    }
    
    
    func updateUIFromModel() {
        scoreLabel.text = "Score: \(gameSet.scorePoint)"
        configureCollectionButtons()
    }
    
    
    func configureCollectionButtons() {
        for button in customButtonCard {
            button.setTitle("", for: .normal)
            button.isEnabled = false
            button.layer.backgroundColor = UIColor.clear.cgColor
            button.layer.cornerRadius    = 10
        }
        
        for index in gameSet.displayedCards.indices {
            let (button, card) = (customButtonCard[index], gameSet.displayedCards[index])
            if gameSet.displayedCards.contains(card) {
                button.isEnabled = true
                button.backgroundColor = gameSet.selectedCards.contains(card) ? .red : .white
            }
        }
    }
}
