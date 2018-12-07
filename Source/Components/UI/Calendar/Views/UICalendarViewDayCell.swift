//
//  UICalendarViewDayCell.swift
//  Client
//
//  Created by Ampe on 11/21/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

/// This cell holds all the data for a single calendar day.
/// It contains a date label on the left.
/// It contains a table view in the middle.
class UICalendarViewDayCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    /// Contains necessary information to
    /// set up the cell.
    private var day: UICalendarViewDay?
    
    /// Contains all the styling for the cell.
    private var configuration: UICalendarViewDayCellConfguration = .default
    
    // MARK: - View Outlets
    
    /// Holds the information surrounding
    /// the day of the month.
    @IBOutlet private weak var titleLabel: UILabel!
    
    /// Holds the information surrounding
    /// the day of the week.
    @IBOutlet private weak var detailLabel: UILabel!
    
    /// Contains all the events for a single day.
    /// One cell per event.
    @IBOutlet private weak var collectionView: UICollectionView!
}

// MARK: - View Lifecycle
extension UICalendarViewDayCell {
    override func awakeFromNib() {
        super.awakeFromNib()
        registerCells()
    }
}

// MARK: - Public Setup Methods
extension UICalendarViewDayCell {
    
    /// Method used for setting the day property.
    ///
    /// - Parameter day: Contains information regarding the specifc cell's day.
    func set(_ day: UICalendarViewDay) {
        self.day = day
    }
    
    /// Method used for setting the configuration of this cell.
    ///
    /// - Parameter configuration: Contains information regarding the setup of this cell.
    func set(_ configuration: UICalendarViewDayCellConfguration) {
        self.configuration = configuration
    }
    
    /// Method used to reload all inputs on the cell.
    /// Call after setting the day or configuration.
    func reload() {
        guard let day = day else {
            return
        }
        
        titleLabel.text = day.description.dayValue
        detailLabel.text = day.description.dayNameShort
        
        collectionView.reloadData()
    }
}

// MARK: - Table View Data Source Implementation
extension UICalendarViewDayCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return day?.events.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return collectionView.dequeueReusableCell(for: indexPath) as UICalendarViewEventCell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        willDisplay cell: UICollectionViewCell,
                        forItemAt indexPath: IndexPath) {
        
        DispatchQueue.main.async { [weak self] in
            guard
                let `self` = self,
                let day = self.day,
                let cell = cell as? UICalendarViewEventCell
            else {
                return
            }
            
            guard day.events.indices.contains(indexPath.row) else {
                return
            }
            
            let event = day.events[indexPath.row]
            
            cell.set(event)
            cell.set(self.configuration.eventCellConfiguration)
            
            cell.reload()
        }
    }
}

// MARK: - Flow Layout Implementation
extension UICalendarViewDayCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.bounds.width,
                      height: configuration.minimumHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return configuration.interitemSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return configuration.lineSpacing
    }
}

// MARK: - Private Helper MethodsH
private extension UICalendarViewDayCell {
    
    /// Used to register the cells contained in the calendar collection view.
    func registerCells() {
        collectionView.registerCollectionViewCell(xibCell: UICalendarViewEventCell.self)
    }
}
