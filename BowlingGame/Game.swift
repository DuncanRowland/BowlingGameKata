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
    
    func isFirstBallOfFrame()->Bool { return _ballId%2 == 0 }
    func isStrike(_ pins: Int)->Bool { return pins == 10 }
    func isSpare(_ pins: Int)->Bool { return (pins + _lastPins) == 10 }
    func isNotLastFrame()->Bool { return _ballId<18 }
    
    func roll(_ pins: Int) {
        score += pins * _multiplier[0]
        
        if isFirstBallOfFrame() { //possible stike
            if isStrike(pins) && isNotLastFrame() {
                _multiplier[0]=_multiplier[1]+1
                _multiplier[1]=2
                _ballId += 1
            } else {
                _multiplier[0]=_multiplier[1]
                _multiplier[1]=1
            }
        } else { //not a possible stike (i.e. so a possible spare)
            if isSpare(pins) && isNotLastFrame() {
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
