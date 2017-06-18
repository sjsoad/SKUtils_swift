//
//  DropdownPresenter.swift
//  SwiftUtils
//
//  Created by Sergey Kostyan on 18.06.17.
//  Copyright © 2017 Sergey. All rights reserved.
//

import UIKit

protocol DropdownViewable: class {
    
    func show()
    func hide()
    
}

protocol DropdownReloadable: DropdownViewable {
    
    func reload(with dataSource: TableViewArrayDataSource)
    
}

protocol DropdownOutput {
    
    func viewTriggeredSelectionEvent(at indexPath: IndexPath)
    func viewDidHide()
    
}

class DropdownPresenter: NSObject {

    fileprivate weak var view: DropdownReloadable?
    fileprivate var dataSource = TableViewArrayDataSource(sections: [])
    
    init(with view: DropdownReloadable) {
        self.view = view
    }
    
    static func showView(in window: UIWindow?, dataSource: TableViewArrayDataSource) {
        guard let dropdownView = DropdownView.newDropdown() else { return }
        let presenter = DropdownPresenter(with: dropdownView)
        dropdownView.presenter = presenter
        presenter.show(in: window)
    }
    
    func show(in window: UIWindow?) {
        
    }
    
}

extension DropdownPresenter: DropdownOutput {

    func viewTriggeredSelectionEvent(at indexPath: IndexPath) {}
    func viewDidHide() {}

}
