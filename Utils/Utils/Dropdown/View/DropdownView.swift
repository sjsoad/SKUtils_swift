//
//  DropdownView.swift
//  SwiftUtils
//
//  Created by Sergey Kostyan on 18.06.17.
//  Copyright © 2017 Sergey. All rights reserved.
//

import UIKit

class DropdownView: UIView, DropdownReloadable {

    var presenter: DropdownOutput?
    
    @IBOutlet private weak var tableView: UITableView!
    
    @IBInspectable var allowsMultipleSelection: Bool = false {
        didSet {
            self.tableView.allowsMultipleSelection = self.allowsMultipleSelection
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    static func newDropdown() -> Self? {
        let name = String(describing: self)
        return fromNib(named: name)
    }
    
    // MARK: - DropdownViewable -
    
    func show() {
        changeAlpha(of: self, to: 1)
    }
    
    func hide() {
        changeAlpha(of: self, to: 0) { [weak self] (_) in
            guard let strongSelf = self else { return }
            strongSelf.presenter?.viewDidHide()
        }
    }
    
    func reload(with dataSource: TableViewArrayDataSource) {
        tableView.dataSource = dataSource
        tableView.reloadData()
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

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        presenter?.viewTriggeredSelectionEvent(at: indexPath)
    }

}
