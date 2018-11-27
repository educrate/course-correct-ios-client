//
//  UICalendarView.swift
//  Client
//
//  Created by Ampe on 11/21/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class UICalendarView: UIView {
    
    // MARK: Properties
    
    /// controlls all internal computation
    /// necessary for setting up the calendar
    private let brain: UICalendarViewBrain = .default
    
    /// configuration of the calendar view
    /// and configurations of subviews
    private let configuration: UICalendarViewConfiguration = .default
    
    // MARK: View Outlets
    
    /// encompasing table view which holds
    /// the date object as well as the
    /// table view for a single day
    @IBOutlet private weak var collectionView: UICollectionView!
    
    /// flow layout of the collection view
    @IBOutlet private weak var collectionViewFlowLayout: UICollectionViewFlowLayout!
    
    // MARK: Protocols
    
    /// delegate for the calendar collection
    var delegate: UICalendarViewDelegate?
    
    /// data source for the calendar collection
    var dataSource: UICalendarViewDataSource?
}

// MARK: - View Lifecycle
extension UICalendarView {
    override func awakeFromNib() {
        super.awakeFromNib()
        move(to: Date(),
             animated: false)
    }
}

// MARK: - Public Update Methods
extension UICalendarView {
    func move(to newDate: Date,
                animated: Bool = true) {
        
//        guard let indexPath = brain.dataSource.indexPath(for: newDate) else {
//            return
//        }
//
//        collectionView.layoutIfNeeded()
//
//        collectionView.scrollToItem(at: indexPath,
//                                    at: .top,
//                                    animated: animated)
    }
}

// MARK: - Table View Data Source Conformation
extension UICalendarView: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return brain.dataSource.numberOfMonths()
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
       
        return brain.dataSource.numberOfDays(in: section)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell: UICalendarViewDayCell = collectionView.dequeueReusableCell(for: indexPath)
        
        return cell
    }
}

// MARK: - Table View Data Source Conformation
extension UICalendarView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
        
        let monthHeader: UICalendarViewMonthHeader = collectionView.dequeueHeaderView(for: indexPath)
        
        return monthHeader
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        willDisplay cell: UICollectionViewCell,
                        forItemAt indexPath: IndexPath) {
        
    }
}

extension UICalendarView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.bounds.width,
                      height: configuration.cellConfiguration.minimumHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return configuration.cellConfiguration.interitemSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return configuration.cellConfiguration.lineSpacing
    }
}
