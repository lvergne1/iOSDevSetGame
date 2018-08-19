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
    
    func areCardsASet(){
        
    }
    init(){
        for _ in 1...81{
            let card = Card()
            cards += [card]
        }
    }
}
