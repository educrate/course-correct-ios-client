//
//  CreditCardViewStyle.swift
//  UIPaymentMethod
//
//  Created by Ampe on 8/10/18.
//

import UIKit

enum CreditCardViewStyle {
    case fill(backgroundColor: UIColor)
    case clear(borderWidth: CGFloat, borderColor: UIColor)
}

extension CreditCardViewStyle {
    static let defaultBorderWidth: CGFloat = 1
    static let defaultBorderColor: UIColor = .darkGray
}

extension CreditCardViewStyle {
    static let `default`: CreditCardViewStyle = .clear(borderWidth: defaultBorderWidth,
                                                              borderColor: defaultBorderColor)
}

extension CreditCardViewStyle {
    var backgroundColor: UIColor {
        switch self {
        case .clear:
            return .clear
        case .fill(let backgroundColor):
            return backgroundColor
        }
    }
    
    var borderWidth: CGFloat {
        switch self {
        case .clear(let borderWidth, _):
            return borderWidth
        case .fill:
            return 0
        }
    }
    
    var borderColor: UIColor {
        switch self {
        case .clear(_, let borderColor):
            return borderColor
        case .fill:
            return .clear
        }
    }
    
    var textColor: UIColor {
        switch self {
        case .clear(_, let borderColor):
            return borderColor
        case .fill:
            return .white
        }
    }
}
