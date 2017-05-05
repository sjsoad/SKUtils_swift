//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//___COPYRIGHT___
//

import UIKit

class ___FILEBASENAMEASIDENTIFIER___ViewController: UIViewController, ArrayTableViewProtocol {

    typealias ViewModelType = ___FILEBASENAMEASIDENTIFIER___ViewModel
    var arrayTableViewModel: ViewModelType? {
        didSet {
            setDataSource(for: <#tableView#>)
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
