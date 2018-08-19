//
//  Card.swift
//  Set
//
//  Created by Leo Vergnetti on 8/19/18.
//  Copyright © 2018 Leo Vergnetti. All rights reserved.
//

import Foundation

struct Card{
    var number: Int
    var shape: Int
    var color: Int
    var shade: Int
    
    static var numberFactory = 1
    static var shapeFactory = 1
    static var colorFactory = 1
    static var shadeFactory = 1
    
    static func makeUniqueIdentifier() -> (number: Int,shape: Int, color: Int, shade: Int){
        let identifier = (number: numberFactory, shape: shapeFactory, color: colorFactory, shade: shadeFactory)
        
        if numberFactory < 3{
            numberFactory += 1
        } else {
            numberFactory = 1
            if shapeFactory < 3 {
                shapeFactory += 1
            } else {
                shapeFactory = 1
                if colorFactory < 3{
                    colorFactory += 1
                }
                else {
                    colorFactory = 1
                    shadeFactory += 1
                }
            }
        }
        return identifier
    }
    
    init() {
        let identifier = Card.makeUniqueIdentifier()
        self.number = identifier.number
        self.shape = identifier.shape
        self.color = identifier.color
        self.shade = identifier.shade
    }
}
