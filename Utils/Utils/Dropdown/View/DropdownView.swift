//
//  DropdownView.swift
//  SwiftUtils
//
//  Created by Sergey Kostyan on 18.06.17.
//  Copyright © 2017 Sergey. All rights reserved.
//

import UIKit

class DropdownView: UIView, DropdownReloadable {

    weak var presenter: DropdownOutput?
    
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var dropdownLeadingConstraint: NSLayoutConstraint!
    @IBOutlet private weak var dropdownTopConstraint: NSLayoutConstraint!
    @IBOutlet private weak var dropdownWidthConstraint: NSLayoutConstraint!
    @IBOutlet private weak var dropdownHeightConstraint: NSLayoutConstraint!
    
    @IBInspectable var allowsMultipleSelection: Bool = false
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    class func newDropdown() -> DropdownView? {
        let nibName = String(describing: self)
        return Bundle.main.loadNibNamed(nibName, owner: nil, options: nil)?.first as? DropdownView
    }
    
    // MARK: - DropdownViewable -
    
    func show() {
        changeAlpha(of: self, to: 1)
    }
    
    func hide() {
        changeAlpha(of: self, to: 0) { [weak self] (_) in
            guard let strongSelf = self else { return }
            strongSelf.presenter?.dropdownDidHide()
        }
    }
    
    func set(rectConfiguration configuration: DropdownRectConfiguration) {
        if let x = configuration.x {
            dropdownLeadingConstraint.constant = x
        }
        if let y = configuration.y {
            dropdownTopConstraint.constant = y
        }
        if let width = configuration.width {
            dropdownWidthConstraint.constant = width
        }
        if let height = configuration.height {
            dropdownHeightConstraint.constant = height
        }
        self.layoutIfNeeded()
}
    
    // MARK: - DropdownReloadable -
    
    func reload(with dataSource: TableViewArrayDataSource) {
        tableView.dataSource = dataSource
        tableView.reloadData()
        tableView.allowsMultipleSelection = allowsMultipleSelection
    }
    
    func register(cellClass name: String) {
        let cellNib = UINib(nibName: name, bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: name)
    }
    
    // MARK: - Actions -
    
    @IBAction func backgroundTapped(_ sender: UITapGestureRecognizer) {
        presenter?.dropdownTriggeredCloseAction()
    }
    
    // MARK: - Private -
    
    private func changeAlpha(of view: UIView, to value: CGFloat, completion: ((Bool) -> Void)? = nil) {
        UIView.animate(withDuration: 0.25,
                       animations: {
                        view.alpha = value
        },
                       completion: completion)
    }
    
}

extension DropdownView: UITableViewDelegate {

    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return .none
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        presenter?.dropdownTriggeredSelectionEvent(at: indexPath)
    }

}
