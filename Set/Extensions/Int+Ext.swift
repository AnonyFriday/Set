//
//  Int+Ext.swift
//  Set
//
//  Created by Vu Kim Duy on 22/1/21.
//

import Foundation

extension Int {
    var arc4random : Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return -Int(arc4random_uniform(UInt32(-self)))
        } else {
            return 0
        }
    }
}
