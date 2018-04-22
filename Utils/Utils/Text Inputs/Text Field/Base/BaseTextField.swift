//
//  SKBaseTextField.swift
//  SKUtilsSwift
//
//  Created by Mac on 20.07.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import UIKit

public class BaseTextField: UITextField {
    
    // MARK: - IBInspectable -
    
    @IBInspectable private(set) var placeholderColor: UIColor? {
        didSet {
            updateAttributtedPlaceholder()
        }
    }
    
    // MARK: - Public Override -
    
    public override var placeholder: String? {
        didSet {
            updateAttributtedPlaceholder()
        }
    }
    
    // MARK: - Lifecyrcle -
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        updateAttributtedPlaceholder()
    }
    
    // MARK: - Private -
    
    private func updateAttributtedPlaceholder() {
        guard let text = placeholder, let color = placeholderColor else { return }
        attributedPlaceholder = NSAttributedString(string: text,
                                                   attributes:[.foregroundColor: color])
    }
    
}
