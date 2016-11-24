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
    
    func isFirstBallOfFrame()->Bool { return (_ballId % 2) == 1 }
    func isStrike(_ pins: Int)->Bool { return pins == 10 }
    func isSpare(_ pins: Int)->Bool { return (pins + _lastPins) == 10 }
    func isLastFrame()->Bool { return _ballId > 18 }
    
    func updateMultiplier(_ pins: Int) {
        if isFirstBallOfFrame() { //possible stike
            if isStrike(pins) && !isLastFrame() {
                _multiplier[0] = _multiplier[1] + 1
                _multiplier[1] = 2
                _ballId += 1
                return
            }
        } else { //not a possible stike (i.e. so a possible spare)
            if isSpare(pins) && !isLastFrame() {
                _multiplier[0] = 2
                _multiplier[1] = 1
                return
            }
        }
        _multiplier[0] = _multiplier[1]
        _multiplier[1] = 1
    }
    
    func roll(_ pins: Int) {
        score += pins * _multiplier[0]
        _lastPins = pins
        _ballId += 1
        updateMultiplier(pins)
    }
}
