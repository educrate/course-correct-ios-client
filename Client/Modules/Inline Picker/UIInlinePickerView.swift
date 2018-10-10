//
//  UIInlinePicker.swift
//  UIInlinePicker
//
//  Created by Ampe on 8/4/18.
//

import UIKit

@IBDesignable
class UIInlinePickerView: UIView {
    
    // MARK: Views
    weak var collectionView: UICollectionView!
    
    // MARK: Storage
    var delegate: UIInlinePickerDelegate?
    var dataSource: UIInlinePickerDataSource?
    
    // MARK: IBInspectables
    @IBInspectable
    var padding: UIEdgeInsets = UIInlinePickerConfig.default.padding
    
    @IBInspectable
    var selectedTextColor: UIColor = UIInlinePickerConfig.default.cellConfig.selectedTextColor
    
    @IBInspectable
    var selectedBackgroundColor: UIColor = UIInlinePickerConfig.default.cellConfig.selectedBackgroundColor
    
    @IBInspectable
    var selectedBorderColor: CGColor = UIInlinePickerConfig.default.cellConfig.selectedBorderColor
    
    @IBInspectable
    var selectedBorderWidth: CGFloat = UIInlinePickerConfig.default.cellConfig.selectedBorderWidth
    
    @IBInspectable
    var unselectedTextColor: UIColor = UIInlinePickerConfig.default.cellConfig.unselectedTextColor
    
    @IBInspectable
    var unselectedBackgroundColor: UIColor = UIInlinePickerConfig.default.cellConfig.unselectedBackgroundColor
    
    @IBInspectable
    var unselectedBorderColor: CGColor = UIInlinePickerConfig.default.cellConfig.unselectedBorderColor
    
    @IBInspectable
    var unselectedBorderWidth: CGFloat = UIInlinePickerConfig.default.cellConfig.unselectedBorderWidth
    
    @IBInspectable
    var cornerRadius: CGFloat = UIInlinePickerConfig.default.cellConfig.cornerRadius
    
    @IBInspectable
    var spacing: UIEdgeInsets = UIInlinePickerConfig.default.cellConfig.spacing
    
    // MARK: Designable Initalizers
    convenience init() {
        
        self.init(frame: CGRect.zero)
    }
    
    override convenience init(frame: CGRect) {
        
        self.init(frame: frame)
    }
    
    // MARK: Programmatic Initalizer
    init(_ frame: CGRect,
                config: UIInlinePickerConfig,
                delegate: UIInlinePickerDelegate?,
                dataSource: UIInlinePickerDataSource?) {
        
        let layout = UICollectionViewFlowLayout()
        layout.estimatedItemSize = CGSize(width: 40, height: 20)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        self.collectionView = collectionView
        
        self.delegate = delegate
        self.dataSource = dataSource
        
        super.init(frame: frame)
        
        setupCollectionView()
        addViews()
        addConstraints()
    }
    
    // MARK: Storyboard Initalizer
    required init?(coder aDecoder: NSCoder) {
        
        let layout = UICollectionViewFlowLayout()
        layout.estimatedItemSize = CGSize(width: 40, height: 20)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        self.collectionView = collectionView
        
        super.init(coder: aDecoder)
        
        setupCollectionView()
        addViews()
        addConstraints()
    }
}

extension UIInlinePickerView {
    func setupCollectionView() {
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(UIInlinePickerCell.self,
                                forCellWithReuseIdentifier: UIInlinePickerCell.reuseIdentifier)
        
        collectionView.backgroundColor = .white
        
        collectionView.allowsSelection = true
        collectionView.allowsMultipleSelection = true
    }
    
    func addViews() {
        
        addSubview(collectionView)
    }
    
    func addConstraints() {
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        collectionView.topAnchor.constraint(equalTo: topAnchor, constant: padding.top).isActive = true
        collectionView.leftAnchor.constraint(equalTo: leftAnchor, constant: padding.left).isActive = true
        collectionView.rightAnchor.constraint(equalTo: rightAnchor, constant: padding.right).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: padding.top).isActive = true
    }
    
    func initConfig(_ config: UIInlinePickerConfig) {
        
        padding = config.padding
        selectedTextColor = config.cellConfig.selectedTextColor
        selectedBackgroundColor = config.cellConfig.selectedBackgroundColor
        selectedBorderColor = config.cellConfig.selectedBorderColor
        selectedBorderWidth = config.cellConfig.selectedBorderWidth
        unselectedTextColor = config.cellConfig.unselectedTextColor
        unselectedBackgroundColor = config.cellConfig.unselectedBackgroundColor
        unselectedBorderColor = config.cellConfig.unselectedBorderColor
        unselectedBorderWidth = config.cellConfig.unselectedBorderWidth
        cornerRadius = config.cellConfig.cornerRadius
        spacing = config.cellConfig.spacing
    }
}

extension UIInlinePickerView: UICollectionViewDelegate {
    public func collectionView(_ collectionView: UICollectionView,
                               didSelectItemAt indexPath: IndexPath) {
        
        print("selected \(indexPath)")
    }
    
    public func collectionView(_ collectionView: UICollectionView,
                               didDeselectItemAt indexPath: IndexPath) {
        
        print("deselected \(indexPath)")
    }
}

extension UIInlinePickerView: UICollectionViewDataSource {
    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        guard let dataSource = dataSource else {
            
            return 0
        }
        
        return dataSource.numberOfSections()
    }
    
    public func collectionView(_ collectionView: UICollectionView,
                               numberOfItemsInSection section: Int) -> Int {
        
        guard let dataSource = dataSource else {
            
            return 0
        }
        
        guard let itemCount = dataSource.numberOfItems(for: section) else {
            
            return 0
        }
        
        return itemCount
    }
    
    func collectionView(_ collectionView: UICollectionView,
                               cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UIInlinePickerCell.reuseIdentifier,
                                                            for: indexPath) as? UIInlinePickerCell else {
                                                                
                                                                assert(false, "collection view cell registration inconsistency")
                                                                return UICollectionViewCell()
        }
        
        guard let dataSource = dataSource else {
            
            assert(false, "a data source must be provided")
            return UICollectionViewCell()
        }
        
        guard let text = dataSource.text(for: indexPath) else {
            
            assert(false, "inconsistency - file a bug")
            return UICollectionViewCell()
        }
        
        cell.update(text)
        
        cell.initConfig(selectedTextColor: selectedTextColor,
                        selectedBackgroundColor: selectedBackgroundColor,
                        selectedBorderColor: selectedBorderColor,
                        selectedBorderWidth: selectedBorderWidth,
                        unselectedTextColor: unselectedTextColor,
                        unselectedBackgroundColor: unselectedBackgroundColor,
                        unselectedBorderColor: unselectedBorderColor,
                        unselectedBorderWidth: unselectedBorderWidth,
                        cornerRadius: cornerRadius,
                        spacing: spacing)
        
        return cell
    }
}
