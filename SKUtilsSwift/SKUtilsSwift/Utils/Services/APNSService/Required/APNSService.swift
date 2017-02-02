//
//  APNSService.swift
//  SKUtilsSwift
//
//  Created by Sergey Kostyan on 11.09.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import Foundation
import UIKit

protocol APNSService {
    
    func setupService()
    func connectToService()
    func disconnectFromService()
}