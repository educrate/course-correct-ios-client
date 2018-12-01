//
//  UICalendarView.swift
//  Client
//
//  Created by Ampe on 11/21/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class UICalendarView: XIBView {
    
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
    @IBOutlet private weak var collectionView: UICollectionView! {
        didSet {
            registerReusableViews()
        }
    }
    
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
    
    func registerReusableViews() {
        collectionView.registerCollectionViewCell(xibCell: UICalendarViewDayCell.self)
        collectionView.registerReusableHeaderView(xibCell: UICalendarViewMonthHeader.self)
    }
}

// MARK: - Public Update Methods
extension UICalendarView {
    func move(to newDate: Date,
                animated: Bool = true) {
        // todo
    }
}

// MARK: - Table View Data Source Conformation
extension UICalendarView: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return brain.dataSource.months()
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
       
        return brain.dataSource.days(in: section)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell: UICalendarViewDayCell = collectionView.dequeueReusableCell(for: indexPath)
        
        let dateIndex = brain.dataSource.dateIndex(for: indexPath)
        let events = dataSource?.events(for: dateIndex)
        let date = UICalendarViewDate(helper: brain.dataSource.helper, indices: dateIndex)
        let day = UICalendarViewDay(date: date, events: events ?? [])
        
        cell.set(day: day, configuration.cellConfiguration)
        cell.reload()
        
        return cell
    }
}

// MARK: - Table View Data Source Conformation
extension UICalendarView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
        
        let monthHeader: UICalendarViewMonthHeader = collectionView.dequeueReusableSupplementaryView(for: indexPath)
        
        let dateIndex = brain.dataSource.dateIndex(for: indexPath)
        let date = UICalendarViewDate(helper: brain.dataSource.helper, indices: dateIndex)
        
        monthHeader.set("\(date.descriptions.monthName) \(date.descriptions.yearValue)")
        monthHeader.reload()
        
        return monthHeader
    }
}

extension UICalendarView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let dateIndex = brain.dataSource.dateIndex(for: indexPath)
        
        guard let dataSource = dataSource else {
            return .zero
        }
        
        let eventCount = CGFloat(dataSource.events(for: dateIndex).count)
        
        guard eventCount > 0 else {
            return .zero
        }
        
        return CGSize(width: collectionView.bounds.width,
                      height: ((configuration.cellConfiguration.minimumHeight + configuration.cellConfiguration.interitemSpacing) * eventCount))
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
