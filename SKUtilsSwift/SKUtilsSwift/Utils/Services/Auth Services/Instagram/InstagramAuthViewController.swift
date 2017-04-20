//
//  InstagramAuthViewController.swift
//  InstagramAuth
//
//  Created by Isuru Nanayakkara on 5/17/16.
//  Copyright © 2016 BitInvent. All rights reserved.
//

import UIKit

class InstagramAuthViewController: UIViewController {

    private let baseURL = "https://api.instagram.com"
    
    var clientId: String!
    var clientSecret: String!
    var redirectUri: String!
    var handler: AuthServiceHandler!
    
    private enum InstagramEndpoints: String {
        case Authorize = "/oauth/authorize/"
        case AccessToken = "/oauth/access_token/"
    }
    
    private var webView: UIWebView!
    internal var activityIndicatorView: UIActivityIndicatorView!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    init(clientId: String, clientSecret: String, redirectUri: String, handler: @escaping AuthServiceHandler) {
        self.clientId = clientId
        self.clientSecret = clientSecret
        self.redirectUri = redirectUri
        self.handler = handler
        
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        URLCache.shared.removeAllCachedResponses()
        HTTPCookieStorage.shared.deleteAllCookies() //.sharedHTTPCookieStorage.deleteAllCookies()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView = UIWebView(frame: view.frame)
        webView.delegate = self
        view.addSubview(webView)
        
        activityIndicatorView = UIActivityIndicatorView(activityIndicatorStyle: .gray)
        activityIndicatorView.center = webView.center
        activityIndicatorView.isHidden = true
        activityIndicatorView.hidesWhenStopped = true
        webView.addSubview(activityIndicatorView)
        
        getLoginPage()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel,
                                                            target: self,
                                                            action: #selector(InstagramAuthViewController.close))
    }
    
    private func getLoginPage() {
        activityIndicatorView.isHidden = false
        activityIndicatorView.startAnimating()
        
        let authUrl = baseURL + InstagramEndpoints.Authorize.rawValue
        let components = NSURLComponents(string: authUrl)!
        components.queryItems = [
            URLQueryItem(name: "client_id", value: clientId),
            URLQueryItem(name: "redirect_uri", value: redirectUri),
            URLQueryItem(name: "response_type", value: "code")
        ]
        let request = NSURLRequest(url: components.url!,
                                   cachePolicy: .reloadIgnoringLocalAndRemoteCacheData,
                                   timeoutInterval: 10)
        webView.loadRequest(request as URLRequest)
    }
    
    internal func requestAccessToken(code: String) {
        let tokenUrl = baseURL + InstagramEndpoints.AccessToken.rawValue
        let components = NSURLComponents(string: tokenUrl)!
        components.queryItems = [
            URLQueryItem(name: "client_id", value: clientId),
            URLQueryItem(name: "client_secret", value: clientSecret),
            URLQueryItem(name: "grant_type", value: "authorization_code"),
            URLQueryItem(name: "redirect_uri", value: redirectUri),
            URLQueryItem(name: "code", value: code)
        ]
        
        let request = NSMutableURLRequest(url: URL(string: tokenUrl)!)
        request.httpMethod = "POST"
        request.httpBody = components.percentEncodedQuery!.data(using: String.Encoding.utf8)
        
        URLSession.shared.dataTask(with: request as URLRequest) { data, response, error in
            if let error = error {
                self.handler(nil,
                             .authTypeInstagram,
                             error)
            } else {
                self.getAccessToken(data: data! as NSData)
            }
        }.resume()
    }
    
    private func getAccessToken(data: NSData) {
        do {
            let result = try JSONSerialization.jsonObject(with: data as Data, options: .allowFragments) as! [String: AnyObject]
            let accessToken = result["access_token"] as! String
            handler(accessToken,
                    .authTypeInstagram,
                    nil)
            close()
        } catch let error as NSError {
            handler(nil,
                    .authTypeInstagram,
                    error)
        }
    }
    
    func close() {
        OperationQueue.main.addOperation {
            self.dismiss(animated: true, completion: nil)
        }
    }

}

extension InstagramAuthViewController: UIWebViewDelegate {
    
    
    internal func webView(_ webView: UIWebView,
                         shouldStartLoadWith request: URLRequest,
                         navigationType: UIWebViewNavigationType) -> Bool {
        let urlString = request.url!.absoluteString
        if let range = urlString.range(of: redirectUri + "/?code=") {
            let location = range.upperBound
            let code = urlString.substring(from: location)
            requestAccessToken(code: code)
            return false
            
        }
        return true
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        activityIndicatorView.stopAnimating()
    }
    
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
        if (error as NSError).domain == NSURLErrorDomain {
            handler(nil,
                    .authTypeInstagram,
                    error)
        }
    }
}

extension HTTPCookieStorage {
    func deleteAllCookies() {
        if let cookies = self.cookies {
            for cookie in cookies {
                self.deleteCookie(cookie)
            }
        }
    }
}
