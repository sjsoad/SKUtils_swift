//
//  InfoView.swift
//  Nioxin
//
//  Created by Sergey on 08.06.17.
//  Copyright © 2017 grossum solutions. All rights reserved.
//

import UIKit

class PopupView: UIView, PopupViewable {
    
    var presenter: PopupOutput?
    
    // outlets
    @IBOutlet private weak var background: UIView!
    @IBOutlet private weak var container: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        container.alpha = 0
        background.alpha = 0
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: - Public -
    
    static func newPopup() -> PopupView? {
        let nibName = String(describing: self)
        return Bundle.main.loadNibNamed(nibName, owner: nil, options: nil)?.first as? PopupView
    }
    
    func show() {
        changeAlpha(of: background, to: 1) { [weak self] (_) in
            guard let strongSelf = self else { return }
            strongSelf.changeAlpha(of: strongSelf.container, to: 1, completion: nil)
        }
    }
    
    func hide() {
        changeAlpha(of: container, to: 0) { [weak self] (_) in
            guard let strongSelf = self else { return }
            strongSelf.changeAlpha(of: strongSelf.background, to: 0, completion: { [weak self] (_) in
                guard let strongSelf = self else { return }
                strongSelf.presenter?.viewDidHide()
            })
        }
    }
    
    // MARK: - Private -
    
    private func changeAlpha(of view: UIView, to value: CGFloat, completion: ((Bool) -> Void)?) {
        UIView.animate(withDuration: 0.25,
                       animations: {
                        view.alpha = value
        },
                       completion: completion)
    }
    
    
    // MARK: - Actions -
    
    @IBAction func closeAction(_ sender: UIButton) {
        presenter?.viewTriggeredCloseEvent()
    }
    
    @IBAction func backgroundTapped(_ sender: UITapGestureRecognizer) {
        presenter?.viewTriggeredCloseEvent()
    }
    
}