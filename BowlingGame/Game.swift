//
//  Game.swift
//  BowlingGame
//
//  Created by Duncan Rowland on 24/11/2016.
//  Copyright © 2016 DuncanRowland. All rights reserved.
//

import Foundation

class Game {
    private var _lastpins: Int = 0
    private var _possibleStrike: Bool = true
    private var _countsTwiceCounter: Int = 0
    public var score: Int = 0
    
    func roll(_ pins: Int) {
        score += pins
        if _countsTwiceCounter > 0 {
            score += pins
            _countsTwiceCounter -= 1
        }
        if _possibleStrike {
            if pins == 10 {
                _countsTwiceCounter = 2
                _possibleStrike = !_possibleStrike
            }
        } else { //not a possible stike (i.e. so a possible spare)
            if (pins + _lastpins) == 10 {
                _countsTwiceCounter = 1
            }
        }
        _possibleStrike = !_possibleStrike
        _lastpins = pins
    }
}
