//
//  Game.swift
//  BowlingGame
//
//  Created by Duncan Rowland on 24/11/2016.
//  Copyright © 2016 DuncanRowland. All rights reserved.
//

import Foundation

class Game {
    private var _score: Int?
    var score: Int? { return _score }
    func roll(_ pins: Int) { _score=0 }
}
