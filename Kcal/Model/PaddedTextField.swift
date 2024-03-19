//
//  PaddedTextField.swift
//  Kcal
//
//  Created by Dana Sami Abu Eid on 19/03/2024.
//

import UIKit

class PaddedTextField: UITextField {

    // Padding for the text field
    var textPadding = UIEdgeInsets(
        top: 0,
        left: 10, // Adjust these values based on your needs
        bottom: 0,
        right: 10
    )

    // Adjust the text position
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: textPadding)
    }

    // Adjust the text position while editing
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: textPadding)
    }

    // Adjust the placeholder position (optional)
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: textPadding)
    }
}
