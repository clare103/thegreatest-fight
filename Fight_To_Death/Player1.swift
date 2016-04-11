//
//  Player1.swift
//  Fight_To_Death
//
//  Created by David Clare on 2/17/16.
//  Copyright © 2016 David Clare. All rights reserved.
//

import Foundation

class Player1: Character {
    

    convenience init(hp: Int, attackPwr: Int, name: String) {
       
        self.init(startingHp: hp, attackPwr: attackPwr, name: name)
        
    }
    
    
}