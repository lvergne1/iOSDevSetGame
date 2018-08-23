//
//  SetModel.swift
//  Set
//
//  Created by Leo Vergnetti on 8/19/18.
//  Copyright © 2018 Leo Vergnetti. All rights reserved.
//
import Foundation

struct SetModel{
    
    var cards = [Card]()
    
    init(){
        for _ in 1...81{
            let card = Card()
            cards += [card]
        }
        shuffleTheCards()
    }
    
    mutating func shuffleTheCards(){
        for index in 0..<cards.count{
            let swapIndex = Int(arc4random_uniform(UInt32(cards.count)))
            let copyOfCardToBeSwapped = cards[index]
            cards[index] = cards[swapIndex]
            cards[swapIndex] = copyOfCardToBeSwapped
        }
    }
}
