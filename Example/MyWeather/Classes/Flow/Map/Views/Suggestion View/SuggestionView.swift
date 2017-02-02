//
//  SuggestionView.swift
//  MyWeather
//
//  Created by Mac on 15.12.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import UIKit

class SuggestionView: UIView, ArrayTableViewProtocol {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var heightConstraint: NSLayoutConstraint! {
        didSet {
            viewHeight = heightConstraint.constant
        }
    }
    
    var viewHeight: CGFloat = 0.0
    var didChangeSuggestions: Dynamic<Bool> = Dynamic(false)
    
    typealias ViewModelType = SuggestionViewModel
    var arrayDataVM: ViewModelType? {
        didSet {
            setDataSource(tableView: tableView)
            didChangeSuggestions.value = true
            changeHeightAccordingToContent()
            changeViewHeight(animated: true)
        }
    }
    
    //MARK: - Public
    
    func clearSuggestions() {
        tableView.dataSource = nil
        tableView.reloadData()
        arrayDataVM = nil
    }
    
    func changeViewHeight(animated: Bool) {
        if animated {
            UIView.animate(withDuration: 0.25, animations: { [weak self] in
                guard let strongSelf = self else { return }
                strongSelf.superview?.layoutIfNeeded()
            })
        }
        else {
            self.superview?.layoutIfNeeded()
        }
    }
    
    //MARK: - Private
    
    private func changeHeightAccordingToContent() {
        let contentHeight = tableView.contentSize.height
        let additionalHeight: CGFloat = contentHeight == 0 ? 0.0 : 10.0
        if contentHeight < viewHeight {
            heightConstraint.constant = contentHeight + additionalHeight
        }
        else {
            heightConstraint.constant = viewHeight
        }
    }
    
}
