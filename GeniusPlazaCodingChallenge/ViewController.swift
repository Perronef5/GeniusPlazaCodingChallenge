//
//  ViewController.swift
//  GeniusPlazaCodingChallenge
//
//  Created by Luis F. Perrone on 11/15/18.
//  Copyright © 2018 Luis Perrone. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        prepareLayout()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func prepareLayout() {
        ApiFunctions.getIOSAppsData { (response, iosApps ) in
            for app in iosApps {
                print(app.artistId)
                print(app.artistName)
                print(app.artistUrl)
                print(app.artworkUrl100)
                print(app.copyright)
                print(app.genres)
                print(app.id)
                print(app.kind)
                print(app.name)
                print(app.releaseDate)
                print(app.url)
            }
        }
    }


}

