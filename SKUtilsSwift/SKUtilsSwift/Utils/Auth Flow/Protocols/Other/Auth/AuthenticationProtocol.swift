//
//  AuthentificationProtocol.swift
//  GeoTouch
//
//  Created by Sergey on 13.03.17.
//  Copyright © 2017 Sergey. All rights reserved.
//

import UIKit

protocol Authenticatable {
    
    var authCredentials: AuthCredentials? { get set }
    
}
