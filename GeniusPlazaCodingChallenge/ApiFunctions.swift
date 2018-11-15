//
//  ApiFunctions.swift
//  GeniusPlazaCodingChallenge
//
//  Created by Luis F. Perrone on 11/15/18.
//  Copyright © 2018 Luis Perrone. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class ApiFunctions {
    
    // Get IOS Apps Data //
    static func getIOSAppsData( completion : @escaping (String, [IOSAppModel]) -> ()){
        NSLog(Constants.IOSAPPS_URL)
    
        Alamofire.request(Constants.IOSAPPS_URL, method: .get).responseJSON (completionHandler: { response in
            
            let json = JSON(response.result.value!)
            NSLog("\(json)")
                
            var iosAppsArray : [IOSAppModel] = []
            let feedObject = JSON(json["feed"])
            let resultsArray = feedObject["results"].arrayValue
            
            for item in resultsArray{
                iosAppsArray.append(ParseHelper.parseIOSApp(item))
            }
            
            if iosAppsArray.isEmpty {
                completion(Constants.RES_UNSUCCESSFUL, [])
            } else {
                completion(Constants.RES_SUCCESS, iosAppsArray)
            }
            
        })
    }

}
    

