//
//  LazyBox.swift
//  Client
//
//  Created by Christian Ampe on 11/29/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import Foundation

final class LazyBox<Input, Result> {
    private let queue = DispatchQueue(label: DispatchQueue.Label.lazyBox.rawValue)
    private var value: LazyValue<Input, Result>
    
    init(computation: @escaping (Input) -> Result) {
        value = .notComputed(computation)
    }
}

extension LazyBox {
    func value(input: Input) -> Result {
        var returnValue: Result!
        
        queue.sync {
            switch self.value {
            case .notComputed(let computation):
                let result = computation(input)
                self.value = .computed(result)
                returnValue = result
            case .computed(let result):
                returnValue = result
            }
        }
        
        return returnValue
    }
}
