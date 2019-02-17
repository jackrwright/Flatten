//
//  Array+Extensions.swift
//  Flatten
//
//  Created by Jack Wright on 2/16/19.
//  Copyright © 2019 Jack Wright. All rights reserved.
//

import Foundation

extension Array {
	
	/*
		flatten an array of arbitrarily nested arrays of strings into a flat array of strings
		(e.g., [['one','two',['three']],'four'] -> ['one','two','three','four'].	
	*/
	
	func flatten() throws -> [String] {
		
		var result = [String]()
		
		for elt in self {
		
			if let str = elt as? String {
				
				result.append(str)
				
			} else if let array = elt as? [Any] {
				
				result += try array.flatten()
				
			} else {
				
				throw FlattenError.invalidInput(elt)
			}
		}
		
		return result
	}
}

enum FlattenError: Error {
	case invalidInput(Any)
}
