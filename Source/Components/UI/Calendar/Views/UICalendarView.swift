//
//  UICalendarView.swift
//  Client
//
//  Created by Christian Ampe on 11/21/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

/// A view used for representing a continuous scrolling
/// calendar.  The data is provided through the data source
/// and information is displayed through the delegate.
final class UICalendarView: XIBView {
    
    // MARK: - View Outlets
    
    /// Encompasing table view which holds
    /// the date object as well as the
    /// table view for a single day.
    @IBOutlet private weak var collectionView: UICollectionView!
    
    /// Flow layout of the collection view.
    @IBOutlet private weak var collectionViewFlowLayout: UICollectionViewFlowLayout!
    
    // MARK: - Properties
    
    /// Configuration of the calendar view
    /// and configurations of subviews
    private let configuration: UICalendarViewConfiguration = .default
    
    // MARK: - External Protocols
    
    /// Delegate for the calendar collection.
    weak var delegate: UICalendarViewDelegate?
    
    /// Data source for the calendar collection.
    weak var dataSource: UICalendarViewDataSource?
    
    // MARK: - Initializers
    
    /// Programmatic initializer override.
    ///
    /// - Parameter frame: Frame passed by the caller.
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    /// Internal storyboard initializer override.
    ///
    /// - Parameter aDecoder: Internal coder passed from the storyboard.
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

// MARK: - View Lifecycle
extension UICalendarView {
    override func awakeFromNib() {
        super.awakeFromNib()
        registerReusableViews()
    }
}

// MARK: - Table View Data Source Conformation
extension UICalendarView: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return dataSource?.numberOfMonths(in: self) ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        
        return dataSource?.calendarView(self, numberOfDaysInSection: section) ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        return collectionView.dequeueReusableCell(for: indexPath) as UICalendarViewDayCell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
        
        return collectionView.dequeueReusableSupplementaryView(for: indexPath) as UICalendarViewMonthHeaderView
    }
}

// MARK: - Collection View Data Source Conformation
extension UICalendarView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView,
                        willDisplay cell: UICollectionViewCell,
                        forItemAt indexPath: IndexPath) {
        
        DispatchQueue.main.async { [weak self] in
            guard
                let `self` = self,
                let dataSource = self.dataSource,
                let cell = cell as? UICalendarViewDayCell
            else {
                return
            }
            
            let day = dataSource.calendarView(self, dayForItemAt: indexPath)
            
            cell.set(day)
            cell.set(self.configuration.cellConfiguration)
            
            cell.reload()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        willDisplaySupplementaryView view: UICollectionReusableView,
                        forElementKind elementKind: String,
                        at indexPath: IndexPath) {
        
        DispatchQueue.main.async { [weak self] in
            guard
                let `self` = self,
                let dataSource = self.dataSource,
                let monthHeader = view as? UICalendarViewMonthHeaderView
            else {
                return
            }
            
            let day = dataSource.calendarView(self, dayForItemAt: indexPath)
            
            monthHeader.set("\(day.description.monthName) \(day.description.yearValue)")
            
            monthHeader.reload()
        }
    }
}

// MARK: - Collection View Data Source Conformation
extension UICalendarView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.bounds.width,
                      height: 100)
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

// MARK: - Private Helper Methods
private extension UICalendarView {
    
    /// Used to register the cells contained in the calendar collection view.
    func registerReusableViews() {
        collectionView.registerCollectionViewCell(xibCell: UICalendarViewDayCell.self)
        collectionView.registerReusableHeaderView(xibCell: UICalendarViewMonthHeaderView.self)
    }
}
