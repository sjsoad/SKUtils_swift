//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//___COPYRIGHT___
//

import UIKit

class ___FILEBASENAMEASIDENTIFIER___ViewController: UIViewController, ArrayCollectionViewProtocol {

    private let navigation = ___FILEBASENAMEASIDENTIFIER___Navigation()
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    typealias ViewModelType = ___FILEBASENAMEASIDENTIFIER___ViewModel
    var arrayCollectionViewModel: ViewModelType? {
        didSet {
            setDataSource(for: collectionView)
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
