//
//  UICreditCardView.swift
//  Client
//
//  Created by Christian Ampe on 11/12/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

/// A view used to represent a single credit card.
final class UICreditCardView: XIBView {
    
    // NARK: - Properties
    
    /// The values associated with the credit card view.
    private var metadata: UICreditCardViewMetadata = .default
    
    /// The properties used to style the credit card view.
    private var configuration: UICreditCardViewConfiguration = .default
    
    // MARK: - View Outlets
    
    /// The view used for laying out all the associated card information.
    /// This is view the implementer sees as the true credit card.
    @IBOutlet private weak var cardView: UIView!
    
    /// The image view for displaying the logo of the associated card.
    @IBOutlet private weak var logoImageView: UIImageView!
    
    /// The label where the account number information is shown.
    @IBOutlet private weak var numberLabel: UILabel!
    
    /// The label where the cvv number information is shown.
    @IBOutlet private weak var cvvLabel: UILabel!
    
    /// The label where the expiration date information is shown.
    @IBOutlet private weak var expirationLabel: UILabel!
    
    /// The label where the account name information is shown.
    @IBOutlet private weak var nameLabel: UILabel!
    
    // MARK: - Constraint Outlets
    
    // these constraints must be set up programatically as they are
    // based on ratio calculations and not static values
    
    /// The constraint responsible for binding the top of the card view to the top of the content view.
    @IBOutlet private weak var cardTopConstraint: NSLayoutConstraint!
    
    /// The constraint responsible for binding the right of the card view to the right of the content view.
    @IBOutlet private weak var cardTrailingConstraint: NSLayoutConstraint!
   
    /// /// The constraint responsible for binding the bottom of the card view to the bottom of the content view.
    @IBOutlet private weak var cardBottomConstraint: NSLayoutConstraint!
    
    /// The constraint responsible for binding the left of the card view to the left of the content view.
    @IBOutlet private weak var cardLeadingConstraint: NSLayoutConstraint!
   
    /// The constraint responsible for anchoring the card to the horizontal center of the content view.
    @IBOutlet private weak var cardCenterXConstraint: NSLayoutConstraint!
    
    /// The constraint responsible for anchoring the card to the vertical center of the content view.
    @IBOutlet private weak var cardCenterYConstraint: NSLayoutConstraint!
    
    /// The constraint responsible for anchoring the logo to the top of the credit card view.
    @IBOutlet private weak var logoTopConstraint: NSLayoutConstraint!
    
    /// The constraint responsible for anchoring the bottom of the number label to the top of the cvv label.
    @IBOutlet private weak var numberBottomConstraint: NSLayoutConstraint!
    
    /// The constraint responsible for anchoring the bottom of the cvv label to the top of the expiration label.
    @IBOutlet private weak var cvvBottomConstraint: NSLayoutConstraint!
   
    /// The constraint responsible for anchoring the bottom of the expiration label to the top of the name label.
    @IBOutlet private weak var expirationBottomConstraint: NSLayoutConstraint!
    
    /// The constraint responsible for anchoring the bottom of the name label to the bottom of the credit card view.
    @IBOutlet private weak var nameBottomConstraint: NSLayoutConstraint!
    
    /// The constraint responsible for anchoring the left side of the logo view to the left side of the credit card view.
    @IBOutlet private weak var logoLeadingConstraint: NSLayoutConstraint!
    
    /// The constraint responsible for anchoring the left side of the number label to the left side of the credit card view.
    @IBOutlet private weak var numberLeadingConstraint: NSLayoutConstraint!
    
    /// The constraint responsible for anchoring the left side of the cvv label to the left side of the credit card view.
    @IBOutlet private weak var cvvLeadingConstraint: NSLayoutConstraint!
    
    /// The constraint responsible for anchoring the left side of the expiration label to the left side of the credit card view.
    @IBOutlet private weak var expirationLeadingConstraint: NSLayoutConstraint!
   
    /// The constraint responsible for anchoring the left side of the name label to the left side of the credit card view.
    @IBOutlet private weak var nameLeadingConstraint: NSLayoutConstraint!
    
    /// The constraint responsible for sizing the width of the logo view.
    @IBOutlet private weak var logoWidthConstraint: NSLayoutConstraint!
    
    /// /// The constraint responsible for sizing the height of the logo view.
    @IBOutlet private weak var logoHeightConstraint: NSLayoutConstraint!
   
    /// The constraint responsible for sizing the height of the number label.
    @IBOutlet private weak var numberHeightConstraint: NSLayoutConstraint!
    
    /// The constraint responsible for sizing the height of the cvv label.
    @IBOutlet private weak var cvvHeightConstraint: NSLayoutConstraint!
    
    /// The constraint responsible for sizing the height of the expiration label.
    @IBOutlet private weak var expirationHeightConstraint: NSLayoutConstraint!
    
    /// The constraint responsible for sizing the height of the name label.
    @IBOutlet private weak var nameHeightConstraint: NSLayoutConstraint!
}

// MARK: - View Lifecycle
extension UICreditCardView {
    override func awakeFromNib() {
        super.awakeFromNib()
        constrain()
        reload()
    }
}

// MARK: - Public Setup Methods
extension UICreditCardView {
    
    /// This method only sets the metadata property on the view.
    /// To see the result of this, reload must be called on the view.
    ///
    /// - Parameter metadata: The new values to be associated with the credit card view.
    func set(_ metadata: UICreditCardViewMetadata) {
        
    }
    
    /// This method only sets the configuration of the view.
    /// To see the result of this, reload must be called on the view.
    ///
    /// - Parameter configuration: The new styling properties for the card view.
    func set(_ configuration: UICreditCardViewConfiguration) {
        self.configuration = configuration
    }
    
    /// This method reloads the configuration and metadata properties on the card view.
    func reload() {
        numberLabel.textColor = configuration.textColor
        cvvLabel.textColor = configuration.textColor
        expirationLabel.textColor = configuration.textColor
        nameLabel.textColor = configuration.textColor
        cardView.backgroundColor = configuration.backgroundColor
        cardView.layer.borderColor = configuration.borderColor.cgColor
        cardView.layer.cornerRadius = configuration.cornerRadius
        cardView.layer.borderWidth = configuration.borderWidth
    }
}

// MARK: - Constraint Methods
private extension UICreditCardView {
    
    /// Helper method used to properly order the execution of
    /// constraint additions to the view.
    func constrain() {
        constrainContent()
        constrainLogo()
        constrainNumber()
        constrainCVV()
        constrainExpiration()
        constrainName()
    }
    
    /// This method is used to resize the internal card view to be of the
    /// proper aspect ratio of a true credit card.
    func constrainContent() {
        if frame.width/frame.height >= 1.586 {
            cardLeadingConstraint.isActive = false
            cardTrailingConstraint.isActive = false
        } else {
            cardTopConstraint.isActive = false
            cardBottomConstraint.isActive = false
        }
        
        cardView.widthAnchor.constraint(equalTo: cardView.heightAnchor, multiplier: 1.586).isActive = true

        layoutIfNeeded()
    }
    
    /// This method is used to constrain the logo into its proper size
    /// and exact location in the top left corner of the credit card view.
    func constrainLogo() {
        logoLeadingConstraint.constant = cardView.frame.height/10
        logoWidthConstraint.constant = cardView.frame.width/5
        logoHeightConstraint.constant = cardView.frame.height/5
        logoTopConstraint.constant = cardView.frame.height/10
    }
    
    /// This method is used to constrain the account number label inside
    /// the credit card view.
    func constrainNumber() {
        numberLeadingConstraint.constant = cardView.frame.height/10
        numberHeightConstraint.constant = cardView.frame.height/10
        numberBottomConstraint.constant = 0
    }
    
    /// This method is used to constrain the cvv label inside
    /// the credit card view.
    func constrainCVV() {
        cvvLeadingConstraint.constant = cardView.frame.height/10
        cvvHeightConstraint.constant = cardView.frame.height/15
        cvvBottomConstraint.constant = cardView.frame.height/20
    }
    
    /// This method is used to constrain the expiration label inside
    /// the credit card view.
    func constrainExpiration() {
        expirationLeadingConstraint.constant = cardView.frame.height/10
        expirationHeightConstraint.constant = cardView.frame.height/15
        expirationBottomConstraint.constant = 0
    }
    
    /// This method is used to constrain the name label inside
    /// the credit card view.
    func constrainName() {
        nameLeadingConstraint.constant = cardView.frame.height/10
        nameHeightConstraint.constant = cardView.frame.height/10
        nameBottomConstraint.constant = cardView.frame.height/10
    }
}
