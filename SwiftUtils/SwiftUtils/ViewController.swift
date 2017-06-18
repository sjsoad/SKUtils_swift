//
//  ViewController.swift
//  SwiftUtils
//
//  Created by Sergey on 14.06.17.
//  Copyright © 2017 Sergey. All rights reserved.
//

import UIKit

class ViewController: UIViewController, DateTextFieldDelegate {

    @IBOutlet private weak var dateTextField: DateTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        dateTextField.dateFieldDelegate = self
        dateTextField.currentDate = Date().addingTimeInterval(-60*60*48)
        dateTextField.dateDisplayingFormat = "dd MMM"
        dateTextField.doneButtonTitle = "Ok"
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - DateTextFieldDelegate -
    
//    func dateTextField(_ dateTextField: DateTextField, selectedDate date: Date) {
//        print(date)
//    }

    func dateTextField(_ dateTextField: DateTextField, pressedDoneButton button: UIBarButtonItem) {
        print("done")
    }
    
}

