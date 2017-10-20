//
//  TablePresenter.swift
//  New Data Source
//
//  Created by Sergey on 19.10.17.
//Copyright © 2017 Sergey. All rights reserved.
//

import Foundation
import UIKit

enum SectionAction: Int {
    
    case delete
    case append
    case insert
    case none
}

enum TableViewMode: Int {
    
    case delete
    case move
    case insert
    case none
    
}

protocol TableInterface: class {
    
    func reload(edititng: Bool)
    func reload(with dataSource: TableViewArrayDataSource)
    func deleteRow(at indexPath: IndexPath)
    func insertRows(at indexPathes: [IndexPath])
    func appendSections(at indexes: [Int])
    func deleteSections(at indexes: [Int])
    func insertSections(at indexes: [Int])
    func debug()
}

protocol TableOutput {
    
    var tableViewEdititngStyle: UITableViewCellEditingStyle { get }
    func viewDidAppear()
    func set(sectionAction: SectionAction)
    func set(tableViewMode: TableViewMode)
}

class TablePresenter: NSObject {
    
    private weak var view: TableInterface?
    private var dataSource = TableViewArrayDataSource(with: [])
    private var tableViewMode: TableViewMode = .none

    init(with view: TableInterface) {
        self.view = view
    }
    
    // MARK: - -
    
    static func showView(in window: UIWindow?) {
        let vc = TableViewController()
        let presenter = TablePresenter(with: vc)
        vc.presenter = presenter
        presenter.show(in: window)
    }
    
    func show(in window: UIWindow?) {
        guard let window = window, let viewController = view as? UIViewController else { return }
        window.rootViewController = viewController
        window.makeKeyAndVisible()
    }
    
    // MARK: - Private -
    
    private func createDataSource() {
        var sections = [SectionModel]()
        for s in 0...2 {
            let section = newSection(with: s)
            sections.append(section)
        }
        dataSource = TableViewArrayDataSource(with: sections, editingProvider: self, movingProvider: self)
        view?.reload(with: dataSource)
    }
    
    private func newSection(with index: Int) -> SectionModel {
        var items = [UserDataSourceModel]()
        for i in 0...3 {
            let indexPath = IndexPath(row: i, section: index)
            let model = newDataSourceModel(for: indexPath)
            items.append(model)
        }
        return SectionModel(withItems: items)
    }
    
    private func newDataSourceModel(for indexPath: IndexPath) -> UserDataSourceModel {
        let model = UserDataSourceModel(model: User(firstName: "index \(indexPath.row)", lastName: "section \(indexPath.section)"),
                                          reuseIdentifier: UserCell.reuseIdentifier)
        return model
    }
    
    // MARK: - appendAction -
    
    private func appendAction() {
        let section = newSection(with: dataSource.sections.count)
        dataSource.append(newSection: section) { [weak self] (indexes) in
            self?.view?.appendSections(at: indexes)
        }
    }
    
    // MARK: - deleteAction -
    
    private func deleteAction() {
        let index = 0
        if dataSource.sections.indices.contains(index) {
            dataSource.remove(sectionAt: index)
            view?.deleteSections(at: [index])
        }
    }
    
    // MARK: - insertAction -
    
    private func insertAction() {
        let index = 0
        let section = newSection(with: index)
        dataSource.insert(newSection: section, at: index) { [weak self] (indexes) in
            self?.view?.insertSections(at: indexes)
        }
    }
    
}

// MARK: - TablePresenterOutput -

extension TablePresenter: TableOutput {

    var tableViewEdititngStyle: UITableViewCellEditingStyle {
        if tableViewMode == .delete {
            return .delete
        }
        if tableViewMode == .insert {
            return .insert
        }
        return .none
    }
    
    func viewDidAppear() {
        createDataSource()
    }
    
    func set(sectionAction: SectionAction) {
        switch sectionAction {
        case .append: appendAction()
        case .delete: deleteAction()
        case .insert: insertAction()
        case .none: print("none")
        }
    }
    
    func set(tableViewMode: TableViewMode) {
        self.tableViewMode = tableViewMode
        view?.reload(edititng: tableViewMode != .delete)
    }
    
}

// MARK: - TableViewRowEditing

extension TablePresenter: TableViewRowEditing {

    var edititngHandler: ((UITableViewCellEditingStyle, IndexPath) -> Void)? {
        return { [weak self] (edititngStyle, indexPath) in
            switch edititngStyle {
            case .delete:
                self?.dataSource.remove(itemAt: indexPath)
                self?.view?.deleteRow(at: indexPath)
            case .insert:
                if let viewModel = self?.newDataSourceModel(for: indexPath) {
                    self?.dataSource.insert(item: viewModel, at: indexPath, handler: { [weak self] (indexPathes) in
                        self?.view?.insertRows(at: indexPathes)
                    })
                }
            case .none:
                print("none")
            }
        }
    }
    
}

// MARK: - TableViewRowMoving

extension TablePresenter: TableViewRowMoving {
    
    var canMoveRow: ((IndexPath) -> Bool)? {
        return { [weak self] indexPath in
            return self?.tableViewMode == .move
        }
    }
    
    var movingHandler: ((IndexPath, IndexPath) -> Void)? {
        return { [weak self] (sourceIndexPath, destinationIndexPath) in
            self?.dataSource.reorderItems(at: sourceIndexPath, and: destinationIndexPath)
            self?.view?.debug()
        }
    }
    
}

