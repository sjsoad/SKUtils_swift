//
//  SKBaseTextField.swift
//  SKUtilsSwift
//
//  Created by Mac on 20.07.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import UIKit

public class BaseTextField: UITextField {
    
    @IBInspectable var placeholderColor: UIColor? {
        didSet {
            self.updateAttributtedPlaceholder()
        }
    }
    
    @IBOutlet var visualisationView: TextFieldAccessoryView?

    public override var placeholder: String? {
        didSet {
            self.updateAttributtedPlaceholder()
        }
    }
    
    // MARK: - Lifecyrcle -
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        updateAttributtedPlaceholder()
    }
    
    // MARK: - Private -
    
    private func updateAttributtedPlaceholder() {
        guard let text = self.placeholder, let color = self.placeholderColor else { return }
        self.attributedPlaceholder = NSAttributedString(string: text,
                                                        attributes:[NSForegroundColorAttributeName: color])
    }
    
}
