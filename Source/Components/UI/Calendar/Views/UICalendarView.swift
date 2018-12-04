//
//  UICalendarView.swift
//  Client
//
//  Created by Ampe on 11/21/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class UICalendarView: XIBView {
    
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
    
    // MARK: Properties
    
    /// controlls all internal computation
    /// necessary for setting up the calendar
    private let brain: UICalendarViewBrain = .default
    
    /// configuration of the calendar view
    /// and configurations of subviews
    private let configuration: UICalendarViewConfiguration = .default
    
    // MARK: Internal Protocols
    
    /// delegate for the calendar collection layout
    private weak var layoutDelegate: UICalendarViewLayoutDelegate!
    
    /// data source for the calendar date formatting
    private weak var dateDataSource: UICalendarViewDateDataSource!
    
    // MARK: External Protocols
    
    /// delegate for the calendar collection
    weak var delegate: UICalendarViewDelegate?
    
    /// data source for the calendar collection
    weak var dataSource: UICalendarViewDataSource?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        dateDataSource = brain.dataSource
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        dateDataSource = brain.dataSource
    }
}

// MARK: - View Lifecycle
extension UICalendarView {
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func registerReusableViews() {
        collectionView.registerCollectionViewCell(xibCell: UICalendarViewDayCell.self)
        collectionView.registerReusableHeaderView(xibCell: UICalendarViewMonthHeaderView.self)
    }
}

// MARK: - Public Update Methods
extension UICalendarView {
    func move(to dateComponents: UICalendarViewDateComponents,
                animated: Bool = true) {
        // todo
    }
}

// MARK: - Table View Data Source Conformation
extension UICalendarView: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return dateDataSource.numberOfMonths()
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return dateDataSource.numberOfDays(in: section)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell: UICalendarViewDayCell = collectionView.dequeueReusableCell(for: indexPath)
        let date = dateDataSource.date(for: indexPath)
        let events = dataSource?.events(for: date.components) ?? []
        let day = UICalendarViewDay(date: date, events: events)
        
        cell.set(day)
        cell.set(configuration.cellConfiguration)
        cell.reload()
        
        return cell
    }
}

// MARK: - Table View Data Source Conformation
extension UICalendarView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
        
        let monthHeader: UICalendarViewMonthHeaderView = collectionView.dequeueReusableSupplementaryView(for: indexPath)
        let date = dateDataSource.date(for: indexPath)
        
        monthHeader.set("\(date.descriptions.monthName) \(date.descriptions.yearValue)")
        monthHeader.reload()
        
        return monthHeader
    }
}

extension UICalendarView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let date = dateDataSource.date(for: indexPath)
        
        guard let dataSource = dataSource else {
            return .zero
        }
        
        let eventCount = CGFloat(dataSource.events(for: date.components).count)
        
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
