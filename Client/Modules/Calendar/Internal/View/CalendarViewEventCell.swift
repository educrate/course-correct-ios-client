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
        
        super.init(style: style,
                   reuseIdentifier: reuseIdentifier)
        
        let sv = UIStackView()
        stackView = sv
        
        let tsv = UIStackView()
        textStackView = tsv
        
        let tl = UILabel()
        titleLabel = tl
        
        let dl = UILabel()
        detailLabel = dl
        
        let lv = UIImageView()
        leftIconImageView = lv
        
        let rv = UIImageView()
        rightIconImageView = rv
        
        initializeViews()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        let sv = UIStackView()
        stackView = sv
        
        let tsv = UIStackView()
        textStackView = tsv
        
        let tl = UILabel()
        titleLabel = tl
        
        let dl = UILabel()
        detailLabel = dl
        
        let lv = UIImageView()
        leftIconImageView = lv
        
        let rv = UIImageView()
        rightIconImageView = rv
        
        initializeViews()
    }
}


// MARK: - Public Setup Methods

extension CalendarViewEventCell {
    func setUp(_ calendarEvent: CalendarEvent) {
        event = calendarEvent
        
        titleLabel.text = calendarEvent.title
        detailLabel.text = calendarEvent.description
    }
}


// MARK: - Private View Setup Methods

private extension CalendarViewEventCell {
    func initializeViews() {
        addViews()
        setUpStackViews()
        addConstraints()
    }
    
    
    // MARK: Initializer Methods
    
    func addViews() {
        addSubview(stackView)
    }
    
    func setUpStackViews() {
        setUpStackView()
        setUpTextStackView()
    }
    
    func setUpStackView() {
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillProportionally
        stackView.spacing = 8
        
        stackView.addArrangedSubview(leftIconImageView)
        stackView.addArrangedSubview(textStackView)
        stackView.addArrangedSubview(rightIconImageView)
    }
    
    func setUpTextStackView() {
        textStackView.axis = .vertical
        textStackView.alignment = .leading
        textStackView.spacing = 8
        
        textStackView.addArrangedSubview(titleLabel)
        textStackView.addArrangedSubview(detailLabel)
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
        rightIconImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
        rightIconImageView.widthAnchor.constraint(equalTo: rightIconImageView.heightAnchor).isActive = true
        
        rightIconImageView.translatesAutoresizingMaskIntoConstraints = false
    }
}

extension CalendarViewEventCell {
    static let identifier = "calendareventcell"
}
