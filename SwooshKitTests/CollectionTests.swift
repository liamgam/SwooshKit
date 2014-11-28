//
//  SwooshKitTests.swift
//  SwooshKitTests
//
//  Created by Airspeed Velocity on 11/27/14.
//  Copyright (c) 2014 Airspeed Velocity. All rights reserved.
//

import SwooshKit
import XCTest

class SwooshKitTests: XCTestCase {

    func testMapSome() {
        let strToInt = { (s: String)->Int? in s.toInt() }
        let intToStr = { (i: Int)->String in "\(i)" }
        
        XCTAssert(equal([1,2,3], mapSome(["1","2","3"], strToInt)))
        XCTAssert(equal([1,2,3], mapSome(["1", "blah","2","3"], strToInt)))
        XCTAssert(equal([] as [Int], mapSome([] as [String], strToInt)))
        
        XCTAssert(equal([1,2,3], mapSome(["1","2","3"], strToInt) as ContiguousArray))
        XCTAssert(equal([1,2,3], mapSome(["1", "blah","2","3"], strToInt) as ContiguousArray))

// These currently crash Xcode but shouldn't
//        XCTAssert(equal(["1","2","3"], mapSome([1,2,3], intToStr)))
//        XCTAssert(equal(["1","2","3"], mapSome(1...3, intToStr)))
    }
    
    func testAccumulate() {
        
        let inital = 0
        let array = [1,2,3]
        let someInts = ["1","2","blah","3"]
        
        let expected = [0,1,3,6]
        
        XCTAssert(equal([0,1,3,6], accumulate([1,2,3], 0, +)))
        XCTAssert(equal([0], accumulate([], 0, +)))
    }
    
    func testDropFirst() {
        XCTAssert(equal([2,3,4],dropFirst(stride(from: 1, to: 5, by: 1))))
        XCTAssert(equal([],dropFirst(stride(from: 1, to: 2, by: 1))))
        XCTAssert(equal([],dropFirst(stride(from: 1, to: 1, by: 1))))
    }
}
