//
//  CalendarViewEventCell.swift
//  FlatCalendar
//
//  Created by Ampe on 9/11/18.
//

import UIKit

class CalendarViewEventCell: UITableViewCell {
    
    
    // MARK: Properties
    
    private var event: CalendarEvent?
    
    
    // MARK: Views
    
    private weak var stackView: UIStackView!
    private weak var textStackView: UIStackView!
    private weak var titleLabel: UILabel!
    private weak var detailLabel: UILabel!
    private weak var leftIconImageView: UIImageView!
    private weak var rightIconImageView: UIImageView!
    
    
    // MARK: Initializers
    
    override init(style: UITableViewCell.CellStyle,
                  reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let tl = UILabel()
        titleLabel = tl
        
        let dl = UILabel()
        detailLabel = dl
        
        let lv = UIImageView()
        leftIconImageView = lv
        
        let rv = UIImageView()
        rightIconImageView = rv
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        let tl = UILabel()
        titleLabel = tl
        
        let dl = UILabel()
        detailLabel = dl
        
        let lv = UIImageView()
        leftIconImageView = lv
        
        let rv = UIImageView()
        rightIconImageView = rv
    }
}


// MARK: - Public Setup Methods

extension CalendarViewEventCell {
    func setUp(_ calendarEvent: CalendarEvent) {
        event = calendarEvent
    }
}


// MARK: - Private View Setup Methods

private extension CalendarViewEventCell {
    func initializeViews() {
        addViews()
        setUpViews()
        addConstraints()
    }
    
    
    // MARK: Initializer Methods
    
    func addViews() {
        addSubview(titleLabel)
        addSubview(detailLabel)
        addSubview(leftIconImageView)
        addSubview(rightIconImageView)
    }
    
    func setUpViews() {
        
    }
    
    func addConstraints() {
        constrainLeftIconImageView()
        constrainTitleLabel()
        constrainDetailLabel()
        constrainRightIconImageView()
    }
    
    
    // MARK: View Constraining
    
    func constrainLeftIconImageView() {
        leftIconImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
        leftIconImageView.widthAnchor.constraint(equalTo: leftIconImageView.heightAnchor).isActive = true
        leftIconImageView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func constrainTitleLabel() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func constrainDetailLabel() {
        
        detailLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func constrainRightIconImageView() {
        rightIconImageView.translatesAutoresizingMaskIntoConstraints = false
    }
}
