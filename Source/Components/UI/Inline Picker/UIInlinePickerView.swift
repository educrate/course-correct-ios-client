//
//  UIInlinePickerView.swift
//  Client
//
//  Created by Christian Ampe on 11/14/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

final class UIInlinePickerView: XIBView {
    
    // MARK: - View Outlets
    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet private weak var collectionViewFlowLayout: UICollectionViewFlowLayout!
    
    // MARK: - Properties
    private var configuration: UIInlinePickerViewConfiguration = .default
    private var options: [String] = []
    
    weak var delegate: UIInlinePickerViewDelegate?
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
    func set(_ newOptions: [String]) {
        options = newOptions
        collectionView.reloadData()
    }
    
    func set(_ newConfiguration: UIInlinePickerViewConfiguration) {
        configuration = newConfiguration
        configure(configuration)
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
        
        cell.set(title)
        cell.set(configuration.cellConfiguration)
        
        return cell
    }
}

extension UIInlinePickerView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard options.indices.contains(indexPath.row) else {
            return
        }
        
        delegate?.inlinePickerView(self, didSelectItemWith: options[indexPath.row])
    }
}

private extension UIInlinePickerView {
    func registerCell() {
         collectionView.registerCollectionViewCell(xibCell: UIInlinePickerViewCell.self)
    }
    
    func setUpCollectionViewFlowLayout() {
        collectionViewFlowLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
    }
    
    func configure(_ configuration: UIInlinePickerViewConfiguration) {
        collectionView.allowsMultipleSelection = configuration.allowsMultipleSelection
    }
}
