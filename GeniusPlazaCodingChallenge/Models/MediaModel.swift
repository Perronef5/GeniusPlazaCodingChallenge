//
//  MediaModel.swift
//  GeniusPlazaCodingChallenge
//
//  Created by Luis F. Perrone on 11/15/18.
//  Copyright © 2018 Luis Perrone. All rights reserved.
//

import Foundation

class MediaModel {
    var artistName : String = ""
    var id: String = ""
    var releaseDate: String = ""
    var name: String = ""
    var kind: String = ""
    var copyright: String = ""
    var artistId: String = ""
    var artistUrl: String = ""
    var artworkUrl100: String = ""
    var genres: [GenreModel] = []
    var url: String = ""
}

class GenreModel {
    var genreId : String = ""
    var name: String = ""
    var url: String = ""
}
