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
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testNoScoreBeforeGameStarts() {
        //Arrange
        let g = Game()
        //Act
        
        //Assert
        XCTAssertTrue(g.score==nil, "Score had value before game started")
    }
    
    func testGutterGame() {
        //Arrange
        let g = Game()
        //Act
        for _ in 0...20 {
            g.roll(0)
        }
        XCTAssertTrue(g.score==0, "Score not 0 for a gutter game")
        //Assert
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
