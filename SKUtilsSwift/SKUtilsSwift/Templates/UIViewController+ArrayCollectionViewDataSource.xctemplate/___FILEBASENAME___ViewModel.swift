//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//___COPYRIGHT___
//

import Foundation
import UIKit

class ___FILEBASENAMEASIDENTIFIER___ViewModel: ArrayCollectionViewModelProtocol {
    
    typealias ModelType = <#ModelType#>
    typealias CellType = <#CellType#>
    
    var collectionViewDataSource: CollectionViewArrayDataSource?
    
    required init(array: [ModelType]) {
//        let groups = createViewModels(fromModels: array)
//        let firstSectionModel = SectionModel(withItems: groups,
//                                             header: nil,
//                                             footer: nil)
//        collectionViewDataSource = CollectionViewArrayDataSource(sections: [firstSectionModel])
    }
    
    func createViewModels(fromModels models: [ModelType]) -> [<#CellViewModel#>] {
//        var viewModels = [ItemCellViewModel]()
//        for model in models {
//            let viewModel = <#init view model#>
//            viewModel.cellReuseIdentifier = <#Cell#>.reuseIdentifier
//            viewModels.append(viewModel)
//        }
        return viewModels
    }
    
}
