//
//  APIManager.swift
//  SKUtilsSwift
//
//  Created by Sergey Kostyan on 01.08.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import Foundation
import Alamofire
import RxCocoa
import RxSwift

class APIManager: NSObject {
    class func loginWithParameters(username: String, password: String) -> Observable<Bool> {
        let credentialData = "\(username):\(password)".dataUsingEncoding(NSUTF8StringEncoding)!
        let base64Credentials = credentialData.base64EncodedStringWithOptions([])
        
        let headers = ["Authorization": "Basic \(base64Credentials)"]
        return Observable.create({ observer in
            let request = Alamofire.request(.GET, "https://api.github.com/user", headers: headers)
                .responseJSON { (response) in
                    print(response)
                    if let value = response.result.value {
                        observer.onNext(true)
                        observer.onCompleted()
                    }else if let error = response.result.error {
                        observer.onError(error)
                    }
            }
            return AnonymousDisposable {
                request.cancel()
            }
        })
    }
}
