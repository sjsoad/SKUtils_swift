//
//  TimerService.swift
//  Place
//
//  Created by Sergey on 07.09.17.
//  Copyright © 2017 the appsolutions. All rights reserved.
//

import Foundation

class DefaultTimerService {

    private var timer: Timer?
    
    func start(timeInterval: TimeInterval, handler: @escaping (() -> Void)) {
        stop()
        timer = Timer(timeInterval: timeInterval, repeats: true, block: { (_) in
            handler()
        })
        timer?.fire()
        guard let timer = timer else { return }
        RunLoop.current.add(timer, forMode: .commonModes)
    }
    
    func stop() {
        timer?.invalidate()
        timer = nil
    }
    
}
