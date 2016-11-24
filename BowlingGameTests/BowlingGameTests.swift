//
//  BowlingGameTests.swift
//  BowlingGameTests
//
//  Created by Duncan Rowland on 24/11/2016.
//  Copyright © 2016 DuncanRowland. All rights reserved.
//

import XCTest
@testable import BowlingGame

class BowlingGameTests: XCTestCase {
    
    private var g: Game = Game()
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        g = Game()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func rollMany(_ n: Int, _ pins: Int) {
        for _ in 0..<n {
            g.roll(pins)
        }
    }
    
    func testNoScoreBeforeGameStarts() {
        //Arrange
        //Act
        //Assert
        XCTAssertTrue(g.score==0, "Score should be 0 before game starts")
    }
    
    func testGutterGame() {
        //Arrange
        //Act
        rollMany(20,0)
        //Assert
        XCTAssertEqual(g.score, 0, "Score should be 0 for a gutter game")
    }
    
    func testAllOnesGame() {
        //Arrange
        //Act
        rollMany(20,1)
        //Assert
        XCTAssertEqual(g.score, 20, "Score should be 20 for an 'all ones' game")
    }
    
    func testSpareGame() {
        //Arrange
        //Act
        g.roll(5)
        g.roll(5)
        g.roll(3)
        //Assert
        XCTAssertEqual(g.score, 16, "Score should be 16 for this spare game (partial)")
    }
    
    func testStrikeGame() {
        //Arrange
        //Act
        g.roll(0)
        g.roll(0)
        g.roll(10)
        g.roll(3)
        g.roll(4)
        //Assert
        XCTAssertEqual(g.score, 24, "Score should be 24 for this stike game (partial)")
    }

    func testPerfectGame() {
        //Arrange
        //Act
        rollMany(22,10)
        //Assert
        XCTAssertEqual(g.score, 400, "Perfect games scores 400")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
