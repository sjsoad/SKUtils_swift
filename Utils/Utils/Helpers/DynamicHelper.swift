//
//  Dynamic.swift
//  MyWeather
//
//  Created by Mac on 29.11.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import Foundation

class Dynamic<T> {
    
    typealias Listener = (T) -> Void
    
    private var listeners: [Listener] = []
    init(_ val: T) {
        value = val
    }
    var value: T {
        didSet {
            for listener in listeners { listener(value) } }
    }
    func bind(listener: @escaping Listener) {
        listeners.append(listener)
        listener(value)
    }
    func addListener(listener: @escaping Listener) {
        listeners.append(listener)
    }
    func clear() {
        listeners.removeAll()
    }
}

