//
//  Dynamic.swift
//  MyWeather
//
//  Created by Mac on 29.11.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import Foundation

class Dynamic<T> {
    typealias Listener = (T) -> ()
    private var listeners: [Listener] = []
    init(_ v: T) {
        value = v
    }
    var value: T {
        didSet {
            for l in listeners { l(value) } }
    }
    func bind(l: @escaping Listener) {
        listeners.append(l)
        l(value)
    }
    func addListener(l: @escaping Listener) {
        listeners.append(l)
    }
}
