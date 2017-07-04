//
//  TestView.swift
//  SwiftUtils
//
//  Created by Sergey Kostyan on 04.07.17.
//  Copyright © 2017 Sergey. All rights reserved.
//

import UIKit

class TestView: XibLoadableView {

    @IBAction func someButtonPressed(_ sender: UIButton) {
        print(sender)
    }
    
    func debug() {
        print("called view function")
    }
    
}
