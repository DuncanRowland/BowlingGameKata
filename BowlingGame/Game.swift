//
//  Game.swift
//  BowlingGame
//
//  Created by Duncan Rowland on 24/11/2016.
//  Copyright © 2016 DuncanRowland. All rights reserved.
//

import Foundation

class Game {
    private var _lastPins: Int = 0
    private var _multiplier: [Int] = [1,1]
    private var _ballId: Int = 0
    public var score: Int = 0
    
    func roll(_ pins: Int) {
        score += pins * _multiplier[0]
        
        if _ballId%2 == 0 { //possible stike (i.e. first balls)
            if pins == 10 && _ballId<18 {
                _multiplier[0]=_multiplier[1]+1
                _multiplier[1]=2
                _ballId += 1
            } else {
                _multiplier[0]=_multiplier[1]
                _multiplier[1]=1
            }
        } else { //not a possible stike (i.e. so a possible spare)
            if (pins + _lastPins) == 10 && _ballId<18 {
                _multiplier[0]=2
                _multiplier[1]=1
            } else {
                _multiplier[0]=_multiplier[1]
                _multiplier[1]=1
            }
        }
        _lastPins = pins
        _ballId += 1
    }
}
