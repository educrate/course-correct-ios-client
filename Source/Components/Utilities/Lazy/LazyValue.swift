//
//  LazyValue.swift
//  Client
//
//  Created by Ampe on 11/29/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import Foundation

enum LazyValue<Input, Value> {
    case notComputed((Input) -> Value)
    case computed(Value)
}
