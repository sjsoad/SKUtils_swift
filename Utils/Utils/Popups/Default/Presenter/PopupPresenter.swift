//
//  InfoPresenter.swift
//  Nioxin
//
//  Created by Sergey on 08.06.17.
//  Copyright © 2017 grossum solutions. All rights reserved.
//

import UIKit

protocol Outputable {
    
    associatedtype PresenterType
    var presenter: PresenterType? { get set }
    
}

protocol Viewable: class {
    
    associatedtype InterfaceType
    var view: InterfaceType? { get }
    
}

protocol PopupViewable: class {
    
    func show()
    func hide()
    
}

protocol PopupOutput {
    
    func viewTriggeredCloseEvent()
    func viewDidHide()
    
}

class PopupPresenter: NSObject, Viewable {
    
    typealias InterfaceType = PopupViewable
    private(set) weak var view: InterfaceType?
    
    fileprivate var displayingWindow: UIWindow?
    
    required init(with view: InterfaceType) {
        self.view = view
    }
    
    // MARK: - Module -
    
    static func show(viewName name: String? = nil, in window: UIWindow?) {
        guard let popupView = PopupView.newPopup(named: name) else { return }
        let presenter = self.init(with: popupView)
        popupView.presenter = presenter
        presenter.show(in: window)
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
    
    // MARK: - Functions -
    
    func hidePopin() {
        view?.hide()
    }
    
    func removePopin() {
        guard let view = view as? UIView else { return }
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
