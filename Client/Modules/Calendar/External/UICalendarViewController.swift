//
//  CalendarView.swift
//  FlatCalendar
//
//  Created by Ampe on 9/11/18.
//

import UIKit

class UICalendarViewController: UIViewController {
    
    
    // MARK: Properties
    
    var brain: CalendarBrain = .default
    
    
    // MARK: Views
    
    /// encompasing table view which holds
    /// the date object as well as the
    /// table view for a single day
    @IBOutlet
    weak var collectionView: UICollectionView!
    
    
    // MARK: Protocols
    var delegate: UICalendarViewDelegate?
    var dataSource: UICalendarViewDataSource?
}


extension UICalendarViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        moveTo(CalendarConfiguration.default.startDate,
               animated: false)
    }
}


// MARK: - Public Update Methods

extension UICalendarViewController {
    func moveTo(_ newDate: Date,
                animated: Bool = true) {
        
        guard let indexPath = brain.dataSource.indexPath(for: newDate) else {
            return
        }
        
        collectionView.layoutIfNeeded()
        
        collectionView.scrollToItem(at: indexPath,
                                    at: .top,
                                    animated: animated)
    }
}


// MARK: - Table View Data Source Conformation

extension UICalendarViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return brain.dataSource.monthCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let dayCount = brain.dataSource.days(in: section) else {
            assert(false, "apple api for date extraction has failed")
            return 0
        }
        
        return dayCount
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UICalendarViewCell.identifier,
                                                            for: indexPath) as? UICalendarViewCell
        else {
            return UICollectionViewCell()
        }
        
        let dayHelper = brain.dataSource.day(from: indexPath)
        
        guard let dateHelper = brain.dataSource.calendarDate(for: dayHelper) else {
            return UICollectionViewCell()
        }
        
        guard let dataSource = dataSource else {
            let day = CalendarDay(date: dateHelper,
                                  events: [])
            
            cell.setUp(day)
            
            return cell
        }
        
        guard let day = dataSource.day(for: dateHelper) else {
            let day = CalendarDay(date: dateHelper,
                                  events: [])
            
            cell.setUp(day)
            
            return cell
        }
        
        cell.setUp(day)
        
        return cell
    }
}


// MARK: - Table View Delegate Conformation

extension UICalendarViewController: UICollectionViewDelegate {
   
}


// MARK: - Table View Flow Layout Conformation

extension UICalendarViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.bounds.size.width,
                      height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 8
    }
}
