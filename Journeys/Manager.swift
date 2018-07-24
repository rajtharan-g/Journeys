//
//  Manager.swift
//  Journeys
//
//  Created by Rajtharan Gopal on 20/07/18.
//  Copyright © 2018 Rajtharan Gopal. All rights reserved.
//

import UIKit

class Manager: NSObject {
    
    static let shared = Manager()
    
    func geocode(placeName: String, completion completionHandler: @escaping (_ addressArray: [Address]?, _ error: Error?) -> Void) {
        let managerObject = GeocodeManager()
        managerObject.getPlace(placeName) { (result, error) in
            // if error is nil, then result is success.  // response is the results array
            if let result = result, let results = result["results"] as? [[String: Any]] {
                var address: [Address] = []
                for result in results {
                    let addressJSON = JSON(result)
                    address.append(Address(fromJson: addressJSON))
                }
                completionHandler(address, error)
            } else {
                completionHandler(nil, error)
            }
        }
    }
    
    func reverseGeocode(startPoint: Double, finalPoint: Double) {
        let reverseGeoCodeManagerObject = ReverseGeocodeManager()
        reverseGeoCodeManagerObject.getPlace(CLLocationCoordinate2DMake(startPoint, finalPoint)) { result, error in
            // if error is nil, then result is success.  // response is the results array
        }
    }
    
}
