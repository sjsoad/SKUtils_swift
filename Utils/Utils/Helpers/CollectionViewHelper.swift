//
//  CollectionViewHelper.swift
//  Nioxin
//
//  Created by Sergey on 31.05.17.
//  Copyright © 2017 grossum solutions. All rights reserved.
//

import UIKit

class CollectionViewHelper: NSObject {

    // MARK: - Registration -
    
    static func register(cellClass: ReusableCell.Type, for collectionView: UICollectionView) {
        let cellNib = UINib(nibName: cellClass.nibName, bundle: nil)
        collectionView.register(cellNib, forCellWithReuseIdentifier: cellClass.reuseIdentifier)
    }
    
    // MARK: - Update Height -
    
    static func updateHeight(of collectionView: UICollectionView, height constraint: NSLayoutConstraint, view: UIView) {
        let constraintValue = constraint.constant
        let collectionContentHeight = collectionView.contentSize.height + collectionView.contentInset.top + collectionView.contentInset.bottom
        if constraintValue != collectionContentHeight {
            constraint.constant = collectionContentHeight
            UIView.animate(withDuration: 0.25) {
                view.layoutIfNeeded()
            }
        }
    }
   
    static func updateWidth(of collectionView: UICollectionView, width constraint: NSLayoutConstraint, view: UIView) {
        let constraintValue = constraint.constant
        let collectionContentWidth = collectionView.contentSize.width + collectionView.contentInset.left + collectionView.contentInset.right
        if constraintValue != collectionContentWidth {
            constraint.constant = collectionContentWidth
            UIView.animate(withDuration: 0.25) {
                view.layoutIfNeeded()
            }
        }
    }
    
    // MARK: - Cell sizing -
    
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
