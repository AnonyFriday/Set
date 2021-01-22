//
//  Card.swift
//  Set
//
//  Created by Vu Kim Duy on 22/1/21.
//

import Foundation

protocol Convertable {
    static var allSelectors : [(Card) -> Attribute] { get }
}

struct Card: CustomStringConvertible
{
    
    var description: String {
        return "Card \(color) \(shading) \(shape) \(quantity)"
    }
    
    var color   : Attribute
    var shading : Attribute
    var shape   : Attribute
    var quantity: Attribute
    
    
    init(color: Attribute, shape: Attribute, shading: Attribute, quantity: Attribute)
    {
        self.color    = color
        self.shading  = shading
        self.quantity = quantity
        self.shape    = shape
    }

}

extension Card: Convertable
{
    static var allSelectors: [(Card) -> Attribute] {
        return [{$0.color}, {$0.quantity}, {$0.shading}, {$0.shape}]
    }
    
    
}
