//
//  ViewController.swift
//  Flatten
//
//  Created by Jack Wright on 2/16/19.
//  Copyright © 2019 Jack Wright. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	
	// MARK: - IB Outlets

	@IBOutlet weak var inputTextView: UITextView!
	
	@IBOutlet weak var outputTextView: UITextView!
	
	
	// MARK: - Button Handlers
	
	@IBAction func solveButtonTapped(_ sender: Any) {
		
		do {
			
			try result = self.input.flatten()
			
			self.outputTextView.text = "\(result)"

		} catch {
			
			self.outputTextView.text = "\(error)"
		}		
	}
	
	let input: [Any] = [["one","two",["three"]],"four"]
	
	var result = [String]()

	override func viewDidLoad() {
		
		super.viewDidLoad()
		
		inputTextView.text = "\(self.input)"
	}
}
