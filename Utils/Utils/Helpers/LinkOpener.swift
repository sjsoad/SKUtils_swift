//
//  LinkOpener.swift
//  Yada
//
//  Created by Sergey on 12.04.2018.
//  Copyright © 2018 Sergey. All rights reserved.
//

import UIKit

class LinkOpener {

    class func open(link: String?, completion: ((Bool) -> Void)?) {
        guard let url = link?.url, UIApplication.shared.canOpenURL(url) else {
            completion?(false)
            return }
        UIApplication.shared.open(url, options: [:], completionHandler: completion)
    }
    
}

private extension String {
    
    var url: URL? {
        return URL(string: self)
    }
    
}
