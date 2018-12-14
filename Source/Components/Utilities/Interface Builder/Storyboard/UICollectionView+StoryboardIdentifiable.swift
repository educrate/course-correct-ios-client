//
//  UICollectionView+StoryboardIdentifiable.swift
//  Client
//
//  Created by Ampe on 12/13/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

// MARK: Collection View Cell Instantiation from Generics
extension UICollectionView {
    func dequeueReusableCell<T: UICollectionViewCell>(for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.storyboardIdentifier, for: indexPath as IndexPath) as? T else {
            fatalError("Cannot dequeue: \(T.self) with identifier: \(T.storyboardIdentifier)")
        }
        
        return cell
    }
    
    func dequeueReusableSupplementaryView<T: UICollectionReusableView>(for indexPath: IndexPath) -> T {
        guard let view = dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: T.storyboardIdentifier, for: indexPath) as? T else {
            fatalError("Cannot dequeue: \(T.self) with identifier: \(T.storyboardIdentifier)")
        }
        
        return view
    }
    
    func registerCollectionViewCell<T: UICollectionViewCell>(xibCell: T.Type) {
        register(UINib(nibName: T.storyboardIdentifier, bundle: nil), forCellWithReuseIdentifier: T.storyboardIdentifier)
    }
    
    func registerReusableHeaderView<T: UICollectionReusableView>(xibCell: T.Type) {
        register(UINib(nibName: T.storyboardIdentifier, bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: T.storyboardIdentifier)
    }
}
