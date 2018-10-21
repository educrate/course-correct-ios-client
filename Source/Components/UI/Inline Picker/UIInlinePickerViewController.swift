//
//  UIInlinePicker.swift
//  Client
//
//  Created by Christian Ampe on 8/4/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class UIInlinePickerViewController: UIViewController {

    // MARK: Views
    @IBOutlet private weak var inlinePicker: UICollectionView!
    
    // MARK: Properties
    private var options: [String] = []
}

extension UIInlinePickerViewController {
    var recommendedHeight: CGFloat {
        return inlinePicker.contentSize.height
    }
}

extension UIInlinePickerViewController {
    func setOptions(_ newOptions: [String]) {
        options = newOptions
        inlinePicker.reloadData()
    }
}

extension UIInlinePickerViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpCollectionView()
    }
}

extension UIInlinePickerViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return options.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard indexPath.row < options.count else {
            return UICollectionViewCell()
        }
        
        let cell: UIInlinePickerCell = collectionView.dequeueReusableCell(for:  indexPath)
        let title = options[indexPath.row]
        
        cell.setTitle(title)
        
        return cell
    }
}

private extension UIInlinePickerViewController {
    func setUpCollectionView() {
        setUpCollectionViewFlowLayout()
        setUpColletionViewOptions()
    }
    
    func setUpCollectionViewFlowLayout() {
        guard let flowLayout = inlinePicker.collectionViewLayout as? UICollectionViewFlowLayout else {
            assertionFailure("\(inlinePicker.description) must have a layout of type UICollectionViewFlowLayout")
            return
        }
        
        flowLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
    }
    
    func setUpColletionViewOptions() {
        inlinePicker.allowsMultipleSelection = true
    }
}
