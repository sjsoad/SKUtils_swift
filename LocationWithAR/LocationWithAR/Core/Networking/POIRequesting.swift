//
//  POIRequestingRequestProtocol.swift
//  SKUtilsSwift
//
//  Created by Sergey on 13.05.17.
//  Copyright © 2017 Sergey Kostyan. All rights reserved.
//

import Foundation
import CoreLocation

typealias POISuccessHandler = (_ response: POIRequest.Response) -> Void
typealias POIResponseType = (places: [PlaceAnnotation], nextPageToken: String?)

protocol POIRequesting: RequestErrorHandling {
    
    func poi(for coordinate: CLLocationCoordinate2D,
             in radius: Int,
             pageToken: String?,
             successHandler: @escaping POISuccessHandler,
             executingHandler: RequestExecutingHandler?,
             errorHandler: ErrorHandler?)
}

extension POIRequesting {
    
    func poi(for coordinate: CLLocationCoordinate2D,
             in radius: Int,
             pageToken: String?,
             successHandler: @escaping POISuccessHandler,
             executingHandler: RequestExecutingHandler? = nil,
             errorHandler: ErrorHandler? = nil) {
        executingHandler?(true)
        let queryString = ["location=\(coordinate.latitude),\(coordinate.longitude)",
            "radius=\(radius)",
            "key=\(Defaults.googlePlacesAPIKey)",
            "pagetoken=\(pageToken ?? "")"].joined(separator: "&")
        let urlString = API.Place.places + "?" + queryString
        let headers = API.Defaults.headers()
        let request = POIRequest(withURL: urlString,
                                 headers: headers)
        let apiClient = APIClient()
        apiClient.executeRequest(request: request,
                                 success: { response in
                                    executingHandler?(false)
                                    successHandler(response)
        },
                                 failure: { error in
                                    executingHandler?(false)
                                    errorHandler?(error)
        })
    }
    
}
