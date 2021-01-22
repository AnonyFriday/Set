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
    @IBOutlet var customButtonCard: [KDButton]!
    @IBAction func touchUpButtonCard(_ sender: KDButton) {
        guard let index = customButtonCard.firstIndex(of: sender) else {
            return
        }
        let card = gameSet.displayedCards[index]
        gameSet.select(card: card)
        updateUIFromModel()
    }
    
    
    func updateUIFromModel() {
        for index in 0..<gameSet.displayedCards.count {
            let (button, card) = (customButtonCard[index], gameSet.displayedCards[index])
            
            // TODO: Drawing card into button
        }
    }
    
   
    
}
