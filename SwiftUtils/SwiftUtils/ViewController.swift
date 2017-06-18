//
//  ViewController.swift
//  SwiftUtils
//
//  Created by Sergey on 14.06.17.
//  Copyright © 2017 Sergey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var dateTextField: DateTextField!
    @IBOutlet private weak var pickerTextField: PickerTextField!
    
    private var pickerManager: PickerManager = {
        var components = [PickerComponentObject]()
        for _ in 0...2 {
            var componentObjects = [PickerRowObject]()
            for i in 0...10 {
                let rowObject = PickerRowObject(title: String(i))
                componentObjects.append(rowObject)
            }
            let componentObject = PickerComponentObject(items: componentObjects)
            components.append(componentObject)
        }
        let pickerConfigurator = PickerDataSourceConfigurator(components: components)
        let pickerManager = PickerManager(configuration: pickerConfigurator) { (object, component, row) in
            print(component, row)
        }
        return pickerManager
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dateTextField.datePicker.date = Date().addingTimeInterval(-60*60*48)
        dateTextField.dateDisplayingFormat = "dd MMM"
        dateTextField.doneButtonTitle = "Ok"
        pickerTextField.reload(with: pickerManager)
        // Do any additional setup after loading the view, typically from a nib.
    }

}

// MARK: - DateTextFieldDelegate -

extension ViewController: DateTextFieldDelegate {
    
    func dateTextField(_ dateTextField: DateTextField, didPressDoneButton button: UIBarButtonItem) {
        dateTextField.resignFirstResponder()
        print("done")
    }
    
}

// MARK: - PickerTextFieldDelegate -

extension ViewController: PickerTextFieldDelegate {

    func pickerTextField(_ pickerTextField: PickerTextField, didPressDoneButton button: UIBarButtonItem) {
        pickerTextField.resignFirstResponder()
        print("done")
    }
    
}
