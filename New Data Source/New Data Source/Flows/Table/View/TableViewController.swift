//
//  TableViewController.swift
//  New Data Source
//
//  Created by Sergey on 19.10.17.
//Copyright © 2017 Sergey. All rights reserved.
//

import UIKit

class TableViewController: UIViewController, TableInterface {

    var presenter: TableOutput?

    @IBOutlet private weak var tableView: UITableView!
    // MARK: - Lifecycle -
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presenter?.viewDidAppear()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }

    // MARK: - IBAction -
    
    @IBAction func sectionActionSelected(_ sender: UISegmentedControl) {
        guard let sectionAction = SectionAction(rawValue: sender.selectedSegmentIndex) else { return }
        presenter?.set(sectionAction: sectionAction)
    }
    
    @IBAction func tableViewModeSelected(_ sender: UISegmentedControl) {
        guard let tableViewMode = TableViewMode(rawValue: sender.selectedSegmentIndex) else { return }
        presenter?.set(tableViewMode: tableViewMode)
    }
    
    // MARK: - Private -
    
    private func setupTableView() {
        let cellNib = UINib(nibName: UserCell.nibName, bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: UserCell.reuseIdentifier)
    }
    
    // MARK: - TableInterface -
    
    func reload(edititng: Bool) {
        // If previous state was
        tableView.reloadData()
        tableView.isEditing = edititng
        tableView.reloadData()
    }
    
    func reload(with dataSource: TableViewArrayDataSource) {
        tableView.dataSource = dataSource
        tableView.reloadData()
    }
    
    func deleteRow(at indexPath: IndexPath) {
        tableView.beginUpdates()
        tableView.deleteRows(at: [indexPath], with: .right)
        tableView.endUpdates()
    }
    
    func insertRows(at indexPathes: [IndexPath]) {
        tableView.beginUpdates()
        tableView.insertRows(at: indexPathes, with: .left)
        tableView.endUpdates()
    }
    
    func appendSections(at indexes: [Int]) {
        tableView.beginUpdates()
        tableView.insertSections(IndexSet(indexes), with: .left)
        tableView.endUpdates()
    }
    
    func deleteSections(at indexes: [Int]) {
        tableView.beginUpdates()
        tableView.deleteSections(IndexSet(indexes), with: .right)
        tableView.endUpdates()
    }
    
    func insertSections(at indexes: [Int]) {
        tableView.beginUpdates()
        tableView.insertSections(IndexSet(indexes), with: .left)
        tableView.endUpdates()
    }
    
    func debug() {
        let sectionsCount = tableView.numberOfSections
        print("-----------------")
        print("sections: \(sectionsCount)")
        for i in 0..<sectionsCount {
            let rowsCount = tableView.numberOfRows(inSection: i)
            print("section: \(i), rows: \(rowsCount)")
        }
        print("-----------------")
    }
    
}

extension TableViewController: UITableViewDelegate {
    
    // Required method
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return presenter?.tableViewEdititngStyle ?? .none
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
    // Optional for reordering
    
//    func tableView(_ tableView: UITableView,
//                   targetIndexPathForMoveFromRowAt sourceIndexPath: IndexPath,
//                   toProposedIndexPath proposedDestinationIndexPath: IndexPath) -> IndexPath {
//        let sectionsCount = tableView.numberOfSections
//        if sourceIndexPath.section != proposedDestinationIndexPath.section {
//            let rowInSourceSection = sourceIndexPath.section > proposedDestinationIndexPath.section ? 0 : sectionsCount - 1
//            return IndexPath(row: rowInSourceSection, section: sourceIndexPath.section)
//        } else if proposedDestinationIndexPath.row >= sectionsCount {
//            return IndexPath(row: sectionsCount - 1, section: sourceIndexPath.section)
//        }
//        // Allow the proposed destination.
//        return proposedDestinationIndexPath
//    }
    
}
