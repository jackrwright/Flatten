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
		
		result = self.input.flatten()
		
		print(result)
		
		self.outputTextView.text = "\(result)"
	}
	
	let input: [Any] = [["one","two",["three"]],"four"]
	
	var result = [String]()

	override func viewDidLoad() {
		
		super.viewDidLoad()
		
		inputTextView.text = "\(self.input)"
	}
}
