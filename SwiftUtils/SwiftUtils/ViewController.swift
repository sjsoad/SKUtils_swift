//
//  ViewController.swift
//  SwiftUtils
//
//  Created by Sergey on 14.06.17.
//  Copyright © 2017 Sergey. All rights reserved.
//

import UIKit

class ViewController: UIViewController, ActivityViewable, AlertViewable, IpRequesting {

    @IBOutlet private weak var textInputsManager: TextInputsManager!
    @IBOutlet private weak var dateTextField: DatePickerField!
    @IBOutlet private weak var pickerTextField: PickerViewField!
    @IBOutlet private weak var xibView: TestView!
    
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
        dateTextField.doneButtonTitle = "Ok"
        pickerTextField.reload(with: pickerManager)
        
        dateTextField.dateSelectionHandler = { field, picker, date in
            print(date)
        }
        dateTextField.doneButtonHandler = { field, sender in
            print("done")
        }
        pickerTextField.doneButtonHandler = { field, sender in
            print("done")
        }
        exampleFunc(successHandler: { (response) in
            print(response.result ?? "nothing")
        },
                    errorHandler: requestErrorHandler())
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        TestPopupPresenter.show(in: self.view.window)
        xibView.debug()
    }
    
    // MARK: - RequestExecuting -
    
    func activityView() -> ActivityViewable? {
        return self
    }
    
    func alertView() -> AlertViewable? {
        return self
    }
    
    // MARK - IpRequesting -
    
}
