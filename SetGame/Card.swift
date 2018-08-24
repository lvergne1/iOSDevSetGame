//
//  Card.swift
//  Set
//
//  Created by Leo Vergnetti on 8/19/18.
//  Copyright © 2018 Leo Vergnetti. All rights reserved.
//

import Foundation

struct Card: Equatable
{
    static func == (lhs: Card, rhs: Card) -> Bool {
        return (lhs.identifierString == rhs.identifierString)
    }
    
    var identifierString: String{
        get {
            return "\(self.identifier.number)" + "\(self.identifier.shape)" + "\(self.identifier.color)" + "\(self.identifier.shade)"
        }
    }
    
    private(set) var identifier : (number: Int, shape: Int, color: Int, shade: Int)
    private static var identifierFactory = (numberFactory: 1, shapeFactory: 1, colorFactory: 1, shadeFactory: 1)
    
    private static func makeUniqueIdentifier() -> (number: Int,shape: Int, color: Int, shade: Int){
        let identifier = (number: identifierFactory.numberFactory, shape: identifierFactory.shapeFactory, color: identifierFactory.colorFactory, shade: identifierFactory.shadeFactory)
        
        if identifierFactory.numberFactory < 3{
            identifierFactory.numberFactory += 1
        } else {
            identifierFactory.numberFactory = 1
            if identifierFactory.shapeFactory < 3 {
                identifierFactory.shapeFactory += 1
            } else {
                identifierFactory.shapeFactory = 1
                if identifierFactory.colorFactory < 3{
                    identifierFactory.colorFactory += 1
                }
                else {
                    identifierFactory.colorFactory = 1
                    identifierFactory.shadeFactory += 1
                }
            }
        }
        return identifier
    }
    
    init() {
        self.identifier = Card.makeUniqueIdentifier()
    }
}
