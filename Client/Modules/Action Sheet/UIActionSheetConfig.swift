//
//  UIActionSheetConfig.swift
//  UIActionSheet
//
//  Created by Ampe on 8/2/18.
//

import UIKit

struct UIActionSheetConfig {
    let cellHeight: CGFloat
    let backgroundColor: UIColor
    let backgroundAlphaValue: CGFloat
    let animationDuration: TimeInterval
    let shouldShowDropShadow: Bool
    let dropShadowConfig: UIActionSheetDropShadowConfig
    
    init(cellHeight: CGFloat,
                backgroundColor: UIColor,
                backgroundAlphaValue: CGFloat,
                animationDuration: TimeInterval,
                shouldShowDropShadow: Bool,
                dropShadowConfig: UIActionSheetDropShadowConfig) {
        
        self.cellHeight = cellHeight
        self.backgroundColor = backgroundColor
        self.backgroundAlphaValue = backgroundAlphaValue
        self.animationDuration = animationDuration
        self.shouldShowDropShadow = shouldShowDropShadow
        self.dropShadowConfig = dropShadowConfig
    }
}

extension UIActionSheetConfig {
    static let `default` = UIActionSheetConfig(cellHeight: 50.0,
                                                        backgroundColor: .black,
                                                        backgroundAlphaValue: 0.5,
                                                        animationDuration: 0.3,
                                                        shouldShowDropShadow: false,
                                                        dropShadowConfig: .default)
}

struct UIActionSheetDropShadowConfig {
    let color: UIColor
    let offset: CGSize
    let radius: CGFloat
    let opacity: Float
    
    init(color: UIColor,
                offset: CGSize,
                radius: CGFloat,
                opacity: Float) {
        
        self.color = color
        self.offset = offset
        self.radius = radius
        self.opacity = opacity
    }
}

extension UIActionSheetDropShadowConfig {
    static let `default` = UIActionSheetDropShadowConfig(color: .black,
                                                                  offset: CGSize(width: 0,
                                                                                 height: -5),
                                                                  radius: 3,
                                                                  opacity: 0.8)
}
