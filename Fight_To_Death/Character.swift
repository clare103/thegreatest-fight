//
//  Character.swift
//  Fight_To_Death
//
//  Created by David Clare on 2/17/16.
//  Copyright © 2016 David Clare. All rights reserved.
//

import Foundation


class Character {
    
    
    private var _hp: Int = 100
    private var _attackPwr: Int = 10
    private var _name: String = ""
    
    var hp: Int {
        get{
            return _hp
        }
    }
    
    var attackPwr: Int {
        get {
            return _attackPwr
        }
    }
    
    var name: String{
        get{
            return _name
        }
    }
    
    var isAlive: Bool{
        get{
            if hp <= 0{
                return false
            }
            else
            {
                return true
            }
        }
    }
    
    func setHp(x: Int){
            _hp = x
    }
    
    
    
    init(startingHp: Int, attackPwr:Int, name: String){
        self._hp = startingHp
        self._attackPwr = attackPwr
        self._name = name
    }
    
    
    func attempAttack(attackPwr: Int) -> Bool{
        self._hp -= attackPwr
        
        return true
    }
    
    
    
    
    
    
}