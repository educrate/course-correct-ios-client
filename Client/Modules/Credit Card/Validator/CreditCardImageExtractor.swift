//
//  ImageExtractor.swift
//  Pods
//
//  Created by Ampe on 8/19/18.
//

import UIKit

struct CreditCardImageExtractor: _ExpressibleByImageLiteral {
    let image: UIImage?
    
    init(imageLiteralResourceName name: String) {
        let bundle = Bundle(for: CreditCardTypeValidator.self)
        image = UIImage(named: name, in: bundle, compatibleWith: nil)
    }
}

extension UIImage {
    static func `for`(_ literal: CreditCardImageExtractor) -> UIImage? {
        return literal.image
    }
}
