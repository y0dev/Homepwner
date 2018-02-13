//
//  Item.swift
//  Homepwner
//
//  Created by Devontae Reid on 2/12/18.
//  Copyright © 2018 Devontae Reid. All rights reserved.
//

import UIKit

class Item: NSObject {
    var name:String
    var valueInDollars: Int
    var serialNumber: String?
    var dateCreated: Date
    
    init(name:String,serialNumber: String?, valueInDollars: Int) {
        self.name = name
        self.valueInDollars = valueInDollars
        self.serialNumber = serialNumber
        self.dateCreated = Date()
        
        super.init()
    }
    
    convenience init(random: Bool = false) {
        if(random) {
            let adjectives = ["Shiny","Glossy","Foggy"]
            let nouns = ["Car","Tree","Door"]
            
            var idx = arc4random_uniform(UInt32(adjectives.count))
            let randomAdj = adjectives[Int(idx)]
            
            idx = arc4random_uniform(UInt32(nouns.count))
            let randomNoun = nouns[Int(idx)]
            
            let randomName = "\(randomAdj) \(randomNoun)"
            let randomValue = Int(arc4random_uniform(100))
            let randomSerialNumber =
                UUID().uuidString.components(separatedBy: "-").first!
            self.init(name: randomName,
                      serialNumber: randomSerialNumber,
                      valueInDollars: randomValue)
        } else {
            self.init(name: "", serialNumber: nil, valueInDollars: 0)
        }
    }
}
