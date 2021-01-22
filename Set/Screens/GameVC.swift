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
        
    }
    
    
    // MARK: Interface Builder
    @IBOutlet var customButtonCard: [UIButton]!
    
    @IBAction func touchUpButtonCard(_ sender: UIButton) {
        guard let index = customButtonCard.firstIndex(of: sender) else {
            return
        }
        print(customButtonCard.count)
        print(gameSet.displayedCards.count)
        let card = gameSet.displayedCards[index]
        gameSet.select(card: card)
        updateUIFromModel()
    }
    
    
    func updateUIFromModel() {
    
    }
    
    
}
