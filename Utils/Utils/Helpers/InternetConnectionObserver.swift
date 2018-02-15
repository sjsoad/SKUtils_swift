//
//  InternetConnectionObserver.swift
//  StudyWiser
//
//  Created by Evgeniy Leychenko on 23.09.16.
//  Copyright © 2016 TheAppSolutions. All rights reserved.
//

import Foundation
import Alamofire

final class InternetConnectionObserver {
    
    static var isReachable: Bool { return connectionObserver?.isReachable ?? false }
    
    static private let connectionObserver = NetworkReachabilityManager(host: "www.apple.com")
    
    static func startObserving(completion: @escaping (Bool) -> Void) {
        connectionObserver?.listener = { status in
            switch status {
            case .reachable(_):
                completion(true)
            default:
                completion(false)
            }
        }
        
        connectionObserver?.startListening()
    }
}
