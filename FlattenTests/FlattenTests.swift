//
//  FlattenTests.swift
//  FlattenTests
//
//  Created by Jack Wright on 2/16/19.
//  Copyright © 2019 Jack Wright. All rights reserved.
//

import XCTest
@testable import Flatten

class FlattenTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFlatArray() {
		
		let array = ["one", "two", "three", "four"]
		
		XCTAssert(array.elementsEqual(array.flatten()))
	}
	
	func testExampleArray() {
		
		let input: [Any] = [["one","two",["three"]],"four"]
		
		let expectedArray = ["one", "two", "three", "four"]
		
		XCTAssert(expectedArray.elementsEqual(input.flatten()))
	}
}
