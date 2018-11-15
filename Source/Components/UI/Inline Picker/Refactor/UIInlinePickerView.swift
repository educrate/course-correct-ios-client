//
//  UIInlinePickerView.swift
//  Client
//
//  Created by Ampe on 11/14/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

final class UIInlinePickerView: XIBView {
    
    // MARK: View Outlets
    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet private weak var collectionViewFlowLayout: UICollectionViewFlowLayout!
    
    // MARK: Properties
    private var configuration: UIInlinePickerViewConfiguration = .default
    private var options: [String] = []
}

extension UIInlinePickerView {
    override func awakeFromNib() {
        super.awakeFromNib()
        registerCell()
        setUpCollectionViewFlowLayout()
        layoutIfNeeded()
    }
}

extension UIInlinePickerView {
    func reload() {
        collectionView.reloadData()
    }
    
    func set(_ newOptions: [String]) {
        options = newOptions
    }
    
    func set(_ newConfiguration: UIInlinePickerViewConfiguration) {
        configuration = newConfiguration
    }
    
    var recommendedHeight: CGFloat {
        return collectionView.contentSize.height
    }
}

extension UIInlinePickerView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return options.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard indexPath.row < options.count else {
            return UICollectionViewCell()
        }
        
        let cell: UIInlinePickerViewCell = collectionView.dequeueReusableCell(for:  indexPath)
        let title = options[indexPath.row]
        
        cell.setTitle(title)
        
        return cell
    }
}

private extension UIInlinePickerView {
    func registerCell() {
         collectionView.register(xibCell: UIInlinePickerViewCell.self)
    }
    
    func setUpCollectionViewFlowLayout() {
        collectionViewFlowLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
    }
}
