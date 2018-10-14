//
//  UIInlinePicker.swift
//  UIInlinePicker
//
//  Created by Ampe on 8/4/18.
//

import UIKit

class UIInlinePickerViewController: UIViewController {

    // MARK: Views
    @IBOutlet private weak var inlinePicker: UICollectionView!
    
    // MARK: Properties
    private var options: [String] = []
}

extension UIInlinePickerViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpCollectionView()
    }
}

extension UIInlinePickerViewController {
    func setOptions(_ newOptions: [String]) {
        options = newOptions
        inlinePicker.reloadData()
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
        inlinePicker.allowsMultipleSelection = true
        
        guard let flowLayout = inlinePicker.collectionViewLayout as? UICollectionViewFlowLayout else {
            assertionFailure("\(inlinePicker.description) must have a layout of type UICollectionViewFlowLayout")
            return
        }
        
        flowLayout.estimatedItemSize = CGSize(width: 40, height: 20)
    }
}
