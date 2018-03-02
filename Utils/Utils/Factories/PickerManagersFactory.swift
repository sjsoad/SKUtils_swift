//
//  PickerManagersFactory.swift
//  Yada
//
//  Created by Sergey on 02.03.2018.
//  Copyright © 2018 Sergey. All rights reserved.
//

import Foundation

class PickerManagersFactory {
    
    class func pickerManager(data: [[String]], selectionHandler: PickerManagerSelectionHandler? = nil) -> PickerManager {
        var components = [PickerComponentObject]()
        
        for component in data {
            var componentObjects = [PickerRowObject]()
            for value in component {
                let rowObject = PickerRowObject(title: value)
                componentObjects.append(rowObject)
            }
            let componentObject = PickerComponentObject(items: componentObjects)
            components.append(componentObject)
        }
        let pickerConfigurator = PickerDataSourceConfigurator(components: components)
        let pickerManager = PickerManager(configuration:pickerConfigurator, selectionHandler: selectionHandler)
        return pickerManager
    }
    
}
