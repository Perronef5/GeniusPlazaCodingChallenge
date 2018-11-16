//
//  HelperFunctions.swift
//  GeniusPlazaCodingChallenge
//
//  Created by Luis F. Perrone on 11/15/18.
//  Copyright © 2018 Luis Perrone. All rights reserved.
//

import Foundation
import UIKit

class CommonUtils {

    static func getDataFromUrl(url: URL, completion: @escaping (_ data: Data?, _ response: URLResponse?, _ error: Error?) -> Void) {
        URLSession.shared.dataTask(with: url) {
            (data, resposne, error) in completion(data, resposne, error)
            }.resume()
        
    }

    static func downloadImage(url: URL, image: UIImageView) {
        print("Download Started")
        getDataFromUrl(url: url) {
            (data, response, error) in guard let data = data, error == nil else { return }
            print(response?.suggestedFilename ?? url.lastPathComponent)
            print("Download Finished")
            DispatchQueue.main.async() { () -> Void in image.image = UIImage(data: data)
            }
        }
        
    }

}
