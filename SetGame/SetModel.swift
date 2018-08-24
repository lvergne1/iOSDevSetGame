//
//  SetModel.swift
//  Set
//
//  Created by Leo Vergnetti on 8/19/18.
//  Copyright © 2018 Leo Vergnetti. All rights reserved.
//
import Foundation

struct SetModel{
    
    var deck = [Card]()
    var alreadyMatchedCards = [Card]()
    var selectedCards = [Card]()
    var activeCards = [Card]()
    
    init(){
        for _ in 1...81{
            let card = Card()
            deck += [card]
        }
        shuffleTheCards()
        dealCards(numberOfCards: 24)
    }
    
    mutating func dealCards(numberOfCards: Int){
        for index in 0..<numberOfCards{
            activeCards += [deck[index]]
            deck.remove(at: index)
        }
    }
    mutating func cardChosen(at index: Int){
        if selectedCards.count == 3{
            selectedCards = [activeCards[index]]
        } else if let indexToBeRemoved = selectedCards.index(of: activeCards[index]){
            selectedCards.remove(at: indexToBeRemoved)
        } else{
            selectedCards += [activeCards[index]]
            if selectedCards.count == 3{
                if selectedCardsAreASet(){
                    alreadyMatchedCards += selectedCards
                }
            }
        }
    }
    
    mutating func shuffleTheCards(){
        for index in 0..<deck.count{
            let swapIndex = Int(arc4random_uniform(UInt32(deck.count)))
            let copyOfCardToBeSwapped = deck[index]
            deck[index] = deck[swapIndex]
            deck[swapIndex] = copyOfCardToBeSwapped
        }
    }
    
    mutating func selectedCardsAreASet() -> Bool{
        var cardsAreASet = true
        for index in selectedCards[0].identifierString.indices{
            if !propertyIsSetConsistent(value_1: selectedCards[0].identifierString[index], value_2: selectedCards[1].identifierString[index], value_3: selectedCards[2].identifierString[index]){
                cardsAreASet = false
                break
            }
        }
        return cardsAreASet
    }
    
    func propertyIsSetConsistent(value_1: Character , value_2: Character, value_3: Character) -> Bool{
        var propertyIsASet = false
        if (value_1 == value_2) && (value_1 == value_3) && (value_2 == value_3){
            propertyIsASet = true
        }
        else if (value_1 != value_2) && (value_1 != value_3) && (value_2 != value_3){
            propertyIsASet = true
        }
        return propertyIsASet
    }
}
