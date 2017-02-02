//
//  MapSearchView.swift
//  MyWeather
//
//  Created by Mac on 13.12.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import UIKit

enum ViewState {
    case normal
    case expanded
}

class MapSearchView: UIView {
    
    @IBOutlet weak var searchFieldBackground: UIView!
    @IBOutlet weak var searchField: UITextField!
    @IBOutlet weak var actionButton: UIButton!
    
    @IBOutlet weak var leadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var widthConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var suggestionView: SuggestionView! {
        didSet {
            suggestionView.changeViewHeight(animated: false)
        }
    }
    
    var viewState: ViewState = ViewState.normal
    var searchVM = MapSearchViewModel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        searchVM.updateUI.bind { [weak self] (updateUI) in
            guard let strongSelf = self else { return }
            strongSelf.suggestionView.arrayDataVM = strongSelf.searchVM.suggestionViewModel()
        }
    }
    
    //MARK: - View managment
    
    func present() {
        viewState = .expanded
        searchField.text = nil
        show()
        suggestionView.show()
    }
    
    func dissmis() {
        viewState = .normal
        searchField.text = nil
        searchField.resignFirstResponder()
        searchVM.cancelSearch()
        hide()
        suggestionView.clearSuggestions()
        suggestionView.hide()
    }
    
    //MARK: - IBAction
    
    @IBAction func pressed(actionButton: UIButton) {
        switch viewState {
        case .normal:
            present()
        default:
            dissmis()
        }
    }
    
}
