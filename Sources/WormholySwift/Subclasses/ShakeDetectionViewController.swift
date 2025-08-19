//
//  ShakeDetectionViewController.swift
//  Wormholy
//
//  Created by Paolo Musolino on 4/12/24.
//

import UIKit

extension UIViewController {
    
    open override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
		//Shake shake
		let alert = UIAlertController(title: "Enter Passcode", message: "Please enter the passcode.", preferredStyle: .alert)
	
		alert.addTextField { textField in
			textField.placeholder = "Enter your passcode"
			textField.keyboardType = .numberPad
			textField.isSecureTextEntry = true
		}
		
		let okAction = UIAlertAction(title: "OK", style: .default) { _ in
			if let textField = alert.textFields?.first {
				let inputText = textField.text ?? ""
				if inputText == "1" {
					NotificationCenter.default.post(name: fireWormholy, object: nil)
				} else {
					self.showValidationAlert()
				}
			}
		}
		
		alert.addAction(okAction)
		
		self.present(alert, animated: true, completion: nil)
		
		//        if motion == .motionShake && Wormholy.shakeEnabled {
		//            NotificationCenter.default.post(name: fireWormholy, object: nil)
		//        }
		
        next?.motionBegan(motion, with: event)
    }
	
	func showValidationAlert() {
		let alert = UIAlertController(title: "Incorrect passcode!", message: nil, preferredStyle: .alert)
		alert.addAction(UIAlertAction(title: "OK", style: .default))
		present(alert, animated: true)
	}
}
