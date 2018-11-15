//
//  ParseHelper.swift
//  GeniusPlazaCodingChallenge
//
//  Created by Luis F. Perrone on 11/15/18.
//  Copyright © 2018 Luis Perrone. All rights reserved.
//

import Foundation
import SwiftyJSON

class ParseHelper {
    
    static func parseIOSApp(_ object: JSON) -> IOSAppModel{
        let iosApp = IOSAppModel()
        
        iosApp.artistName = object["artistName"].stringValue
        iosApp.id = object["id"].stringValue
        iosApp.releaseDate = object["releaseDate"].stringValue
        iosApp.name = object["name"].stringValue
        iosApp.kind = object["kind"].stringValue
        iosApp.copyright = object["copyright"].stringValue
        iosApp.artistId = object["artistId"].stringValue
        iosApp.artistUrl = object["artistUrl"].stringValue
        iosApp.artworkUrl100 = object["artworkUrl100"].stringValue
        iosApp.genres = parseGenres(object["genres"].arrayValue)
        iosApp.url = object["url"].stringValue
        
        return iosApp
}
    
    static func parseGenres(_ objectArray: [JSON]) -> [GenreModel] {
        var genreArray = [GenreModel]()
        
        for object in objectArray {
            let genre = GenreModel()
            genre.genreId = object["genreId"].stringValue
            genre.name = object["name"].stringValue
            genre.url = object["url"].stringValue
            genreArray.append(genre)
        }
        
        return genreArray
    }

}
