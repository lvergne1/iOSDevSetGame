//
//  ViewController.swift
//  SetGame
//
//  Created by Leo Vergnetti on 8/19/18.
//  Copyright © 2018 Leo Vergnetti. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        displayCards()
    }
    
    
    lazy var game = SetModel()
    @IBOutlet var cardButtons: [UIButton]!
    
    @IBAction func cardTouched(_ sender: UIButton) {
        if let cardNumber = cardButtons.index(of: sender){
            game.cardChosen(at: cardNumber)
            updateViewFromModel()
        }
    }
    
    func displayCards(){
        for index in 0..<cardButtons.count{
            cardButtons[index].setAttributedTitle(getCardLabel(cardIndex: index), for: UIControlState.normal)
        }
    }
    
    func updateViewFromModel(){
        removeBorders()
        for card in game.selectedCards{
            if let cardIndex = game.activeCards.index(of: card){
                drawBorder(atCard: cardIndex, color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
            }
        }
        for card in game.alreadyMatchedCards{
            if let cardIndex = game.activeCards.index(of: card){
                drawBorder(atCard: cardIndex, color: #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1))
            }
        }
    }
    
    func removeBorders(){
        for cardButton in cardButtons{
            cardButton.layer.borderWidth = 0.0
        }
    }
    
    func drawBorder(atCard cardIndex: Int, color : CGColor){
        cardButtons[cardIndex].layer.borderWidth = 3.0
        cardButtons[cardIndex].layer.borderColor = color
    }
    
    func getCardLabel(cardIndex index : Int) -> NSAttributedString{
        let attributes : [NSAttributedStringKey: Any] = [
            .foregroundColor: color[game.activeCards[index].identifier.color]!.withAlphaComponent(shade[game.activeCards[index].identifier.shade]!.alphaComponent),
            .strokeWidth: shade[game.activeCards[index].identifier.shade]!.strokeWidth,
            .strokeColor: color[game.activeCards[index].identifier.color]!
        ]
        var cardLabel = ""
        for numberIndex in 1...game.activeCards[index].identifier.number{
            cardLabel += shape[game.activeCards[index].identifier.shape]!
            if numberIndex != game.activeCards[index].identifier.number { cardLabel += "\r"}
            
        }
        return NSAttributedString(string: cardLabel, attributes: attributes)
    }
    
    let color : Dictionary<Int,UIColor> = [1: #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1), 2: #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1), 3: #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)]
    let shape = [1:"▲", 2: "●", 3:"■"]
    let shade = [1:(alphaComponent: CGFloat(100.0), strokeWidth: 0),
                 2: (alphaComponent: CGFloat(0.15), strokeWidth: 0),
                 3: (alphaComponent: CGFloat(0.0), strokeWidth: 10)]
}

