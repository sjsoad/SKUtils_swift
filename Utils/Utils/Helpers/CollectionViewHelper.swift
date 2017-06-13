//
//  CollectionViewHelper.swift
//  Nioxin
//
//  Created by Sergey on 31.05.17.
//  Copyright © 2017 grossum solutions. All rights reserved.
//

import UIKit

class CollectionViewHelper: NSObject {

    static func cellSize(for collectionView: UICollectionView,
                         layout collectionViewLayout: UICollectionViewLayout,
                         numberOfCellsInRow: CGFloat,
                         cellHeightRation: CGFloat) -> CGSize {
        guard let flowLayout = collectionViewLayout as? UICollectionViewFlowLayout else { return CGSize.zero }
        let insetsSpacing = flowLayout.sectionInset.left + flowLayout.sectionInset.right
        let spacingBetweenCells = (numberOfCellsInRow - 1) * flowLayout.minimumInteritemSpacing
        let content = collectionView.bounds.width - insetsSpacing - spacingBetweenCells
        let width = floor(content / numberOfCellsInRow)
        let height = floor(width * cellHeightRation)
        let cellSize = CGSize(width: width, height: height)
        return cellSize
    }
    
    static func cellSize(for collectionView: UICollectionView,
                         layout collectionViewLayout: UICollectionViewLayout,
                         numberOfCellsInRow: CGFloat,
                         cellHeight: CGFloat) -> CGSize {
        guard let flowLayout = collectionViewLayout as? UICollectionViewFlowLayout else { return CGSize.zero }
        let insetsSpacing = flowLayout.sectionInset.left + flowLayout.sectionInset.right
        let spacingBetweenCells = (numberOfCellsInRow - 1) * flowLayout.minimumInteritemSpacing
        let content = collectionView.bounds.width - insetsSpacing - spacingBetweenCells
        let width = floor(content / numberOfCellsInRow)
        let height = cellHeight
        let cellSize = CGSize(width: width, height: height)
        return cellSize
    }
    
}
