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
    
    let locationPermissions: ServicePermissions = {
        let alertTitles = AlertTitles(title: "Location Service",
                                      message: "Location service is disabled! Please turn on it in Settings",
                                      actionButtonTitle: "Go to Settings",
                                      cancelButtonTitle: "Cancel")
        let locationPermissions = LocationPermissions(settingAlertTitles: alertTitles)
        return locationPermissions
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let state = locationPermissions.permissionsState()
        if state == .permissionsNotAsked {
            locationPermissions.requestPermissions(handler: { (state) in
                
            })
        }
        
//        let userDefaultsService: UserDefaultsSetting & UserDefaultsRemoving = DefaultUserDefaultsService()
//        userDefaultsService.
        
        dateTextField.datePicker.date = Date().addingTimeInterval(-60*60*48)
        dateTextField.set(doneTitle: "Ok")
        pickerTextField.reload(with: pickerManager)
        
        dateTextField.set(dateSelectionHandler: { field, picker, date in
            print(date)
        })
        dateTextField.set(doneButtonHandler: { field, sender in
            print("done")
        })
        pickerTextField.set(doneButtonHandler: { field, sender in
            print("done")
        })
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
