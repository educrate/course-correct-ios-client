//
//  UICreditCardView.swift
//  Client
//
//  Created by Ampe on 11/12/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

final class UICreditCardView: XIBView {
    
    // MARK: View Outlets
    @IBOutlet private weak var contentView: UIView!
    @IBOutlet private weak var cardView: UIView!
    @IBOutlet private weak var logoImageView: UIImageView!
    @IBOutlet private weak var numberLabel: UILabel!
    @IBOutlet private weak var cvvLabel: UILabel!
    @IBOutlet private weak var expirationLabel: UILabel!
    @IBOutlet private weak var nameLabel: UILabel!
    
    // MARK: Constraint Outlets
    @IBOutlet private weak var cardTopConstraint: NSLayoutConstraint!
    @IBOutlet private weak var cardTrailingConstraint: NSLayoutConstraint!
    @IBOutlet private weak var cardBottomConstraint: NSLayoutConstraint!
    @IBOutlet private weak var cardLeadingConstraint: NSLayoutConstraint!
    @IBOutlet private weak var cardCenterXConstraint: NSLayoutConstraint!
    @IBOutlet private weak var cardCenterYConstraint: NSLayoutConstraint!
    @IBOutlet private weak var cardAspectRatio: NSLayoutConstraint!
    @IBOutlet private weak var logoTopConstraint: NSLayoutConstraint!
    @IBOutlet private weak var numberBottomConstraint: NSLayoutConstraint!
    @IBOutlet private weak var cvvBottomConstraint: NSLayoutConstraint!
    @IBOutlet private weak var expirationBottomConstraint: NSLayoutConstraint!
    @IBOutlet private weak var nameBottomConstraint: NSLayoutConstraint!
    @IBOutlet private weak var logoLeadingConstraint: NSLayoutConstraint!
    @IBOutlet private weak var numberLeadingConstraint: NSLayoutConstraint!
    @IBOutlet private weak var cvvLeadingConstraint: NSLayoutConstraint!
    @IBOutlet private weak var expirationLeadingConstraint: NSLayoutConstraint!
    @IBOutlet private weak var nameLeadingConstraint: NSLayoutConstraint!
    @IBOutlet private weak var logoWidthConstraint: NSLayoutConstraint!
    @IBOutlet private weak var logoHeightConstraint: NSLayoutConstraint!
    @IBOutlet private weak var numberHeightConstraint: NSLayoutConstraint!
    @IBOutlet private weak var cvvHeightConstraint: NSLayoutConstraint!
    @IBOutlet private weak var expirationHeightConstraint: NSLayoutConstraint!
    @IBOutlet private weak var nameHeightConstraint: NSLayoutConstraint!
}

extension UICreditCardView {
    override func awakeFromNib() {
        super.awakeFromNib()
        setUp()
    }
}

private extension UICreditCardView {
    func setUp() {
        style()
        constrain()
    }
}

private extension UICreditCardView {
    func style() {
        cardView.layer.borderWidth = 1.0
        cardView.layer.borderColor = UIColor.black.cgColor
        cardView.layer.cornerRadius = 3.0
    }
}

private extension UICreditCardView {
    func constrain() {
        constrainContent()
        constrainLogo()
        constrainNumber()
        constrainCVV()
        constrainExpiration()
        constrainName()
    }
    
    func constrainContent() {
        if frame.width/frame.height >= cardAspectRatio.constant {
            cardLeadingConstraint.isActive = false
            cardTrailingConstraint.isActive = false
        } else {
            cardTopConstraint.isActive = false
            cardBottomConstraint.isActive = false
        }

        layoutIfNeeded()
    }
    
    func constrainLogo() {
        logoLeadingConstraint.constant = cardView.frame.height/10
        logoWidthConstraint.constant = cardView.frame.width/5
        logoHeightConstraint.constant = cardView.frame.height/5
        logoTopConstraint.constant = cardView.frame.height/10
    }
    
    func constrainNumber() {
        numberLeadingConstraint.constant = cardView.frame.height/10
        numberHeightConstraint.constant = cardView.frame.height/10
        numberBottomConstraint.constant = 0
    }
    
    func constrainCVV() {
        cvvLeadingConstraint.constant = cardView.frame.height/10
        cvvHeightConstraint.constant = cardView.frame.height/15
        cvvBottomConstraint.constant = cardView.frame.height/20
    }
    
    func constrainExpiration() {
        expirationLeadingConstraint.constant = cardView.frame.height/10
        expirationHeightConstraint.constant = cardView.frame.height/15
        expirationBottomConstraint.constant = 0
    }
    
    func constrainName() {
        nameLeadingConstraint.constant = cardView.frame.height/10
        nameHeightConstraint.constant = cardView.frame.height/10
        nameBottomConstraint.constant = cardView.frame.height/10
    }
}
