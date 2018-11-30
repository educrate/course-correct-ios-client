//
//  UICalendarViewDayCell.swift
//  Client
//
//  Created by Ampe on 11/21/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

/// this cell holds all the data for a single calendar day
/// contains a date label on the left
/// contains a table view in the middle
class UICalendarViewDayCell: UICollectionViewCell {
    
    // MARK: Properties
    
    /// contains necessary information to
    /// set up the day collection view
    private var day: UICalendarViewDay?
    
    /// contains all the styling for the cell
    private var configuration: UICalendarViewCellConfguration = .default
    
    // MARK: View Outlets
    
    /// holds the information surrounding
    /// the day of the month
    @IBOutlet private weak var titleLabel: UILabel!
    
    /// holds the information surrounding
    /// the day of the week
    @IBOutlet private weak var detailLabel: UILabel!
    
    /// contains all the events for a single day
    /// one cell per event
    @IBOutlet private weak var collectionView: UICollectionView! {
        didSet {
            registerCells()
        }
    }
}

// MARK: - Public Setup Methods
extension UICalendarViewDayCell {
    func set(_ calendarDay: UICalendarViewDay) {
        day = calendarDay
    }
    
    func set(_ newConfiguration: UICalendarViewCellConfguration) {
        configuration = newConfiguration
    }
    
    func reload() {
        guard let day = day else {
            return
        }
        
        titleLabel.text = day.date.descriptions.dayValue
        detailLabel.text = day.date.descriptions.dayNameShort
        
        collectionView.reloadData()
    }
}

// MARK: - Table View Protocol Conformance
extension UICalendarViewDayCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let day = day else {
            return 0
        }
        
        return day.events.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let day = day else {
            return UICollectionViewCell()
        }
        
        let events = day.events
        let rowIndex = indexPath.row
        
        guard events.indices.contains(rowIndex) else {
            return UICollectionViewCell()
        }
        
        let event = events[rowIndex]
        
        let cell: UICalendarViewEventCell = collectionView.dequeueReusableCell(for: indexPath)
        
        cell.set(event)
        cell.reload()
        
        return cell
    }
}

extension UICalendarViewDayCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let fullCollectionWidth = collectionView.bounds.width
        
        return CGSize(width: fullCollectionWidth,
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

private extension UICalendarViewDayCell {
    func registerCells() {
        collectionView.registerCollectionViewCell(xibCell: UICalendarViewEventCell.self)
    }
}
