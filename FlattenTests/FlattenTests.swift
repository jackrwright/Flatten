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
		
		do {
			
			let result = try array.flatten()
		
			XCTAssert(array.elementsEqual(result))
			
		} catch {
			
			XCTFail("\(error.localizedDescription)")
		}
	}
	
	func testExampleArray() {
		
		let input: [Any] = [["one","two",["three"]],"four"]
		
		let expectedArray = ["one", "two", "three", "four"]
		
		do {
			
			let result = try input.flatten()
			
			XCTAssert(result.elementsEqual(expectedArray))
			
		} catch {
			
			XCTFail("\(error.localizedDescription)")
		}
	}
	
	func testEmptyArrayElement() {
		
		let input: [Any] = [["one","two",[]],"four"]
		
		let expectedArray = ["one", "two", "four"]
		
		do {
			
			let result = try input.flatten()
			
			XCTAssert(result.elementsEqual(expectedArray))
			
		} catch {
			
			XCTFail("\(error.localizedDescription)")
		}
	}
	
	func testEmptyStringElement() {
		
		let input: [Any] = [["one","two",[""]],"four"]
		
		let expectedArray = ["one", "two", "", "four"]
		
		do {
			
			let result = try input.flatten()
			
			XCTAssert(result.elementsEqual(expectedArray))
			
		} catch {
			
			XCTFail("\(error.localizedDescription)")
		}
	}
	
	func testEmptyInput() {
		
		let input: [Any] = []
		
		let expectedArray: [String] = []
		
		do {
			
			let result = try input.flatten()
			
			XCTAssert(result.elementsEqual(expectedArray))
			
		} catch {
			
			XCTFail("\(error.localizedDescription)")
		}
	}
	
	func testThrowsOnInvalidInput() {
		
		let input: [Any] = [["one","two",[3]],"four"]
		
		do {
			
			let _ = try input.flatten()
			
			XCTFail("This should have failed!")
			
		} catch {
			
			XCTAssertNoThrow(FlattenError.invalidInput("\(error.localizedDescription)"))
		}
	}
}
