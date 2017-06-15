//
//  InfoPresenter.swift
//  Nioxin
//
//  Created by Sergey on 08.06.17.
//  Copyright © 2017 grossum solutions. All rights reserved.
//

import UIKit

protocol PopupInterface: class {
    
    func show()
    func hide()
    
}

protocol PopupOutput {
    
    func viewTriggeredCloseEvent()
    func viewDidHide()
    
}

class PopupPresenter: NSObject {

    weak var view: PopupInterface?
    fileprivate var displayingWindow: UIWindow?
    
    init(with view: InfoInterface) {
        self.view = view
    }
    
    func show(in window: UIWindow?) {
        guard let view = view as? UIView,
            let window = window else {
                return
        }
        displayingWindow = window
        view.frame = window.bounds
        window.addSubview(view)
        self.view?.show()
    }
    
    func hidePopin() {
        view?.hide()
    }
    
    func removePopin() {
        guard let view = view as? UIView else {
            return
        }
        
        view.removeFromSuperview()
    }
    
}

extension PopupPresenter: PopupOutput {
    
    func viewTriggeredCloseEvent() {
        hidePopin()
    }
    
    func viewDidHide() {
        removePopin()
    }
    
}
