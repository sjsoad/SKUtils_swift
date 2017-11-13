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
    
    private var listeners: [String: Listener] = [:]
    
    init(_ val: T) {
        value = val
    }
    var value: T {
        didSet {
            let allListeneres = listeners.flatMap({ $0.value })
            allListeneres.forEach { (listener) in
                listener(value)
            }
        }
    }
    
    func bind(listener: @escaping Listener) -> String {
        let uuid = UUID().uuidString
        listeners[uuid] = listener
        listener(value)
        return uuid
    }
    
    func addListener(listener: @escaping Listener) -> String {
        let uuid = UUID().uuidString
        listeners[uuid] = listener
        return uuid
    }
    
    func remove(listenerWith id: String) {
        listeners.removeValue(forKey: id)
    }
    
    func clear() {
        listeners.removeAll()
    }
}
