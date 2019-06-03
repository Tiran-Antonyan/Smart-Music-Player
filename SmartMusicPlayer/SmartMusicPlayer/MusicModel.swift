//
//  MusicModel.swift
//  MusicPlayer
//
//  Created by macOSHighSierra1036 on 3/06/19.
//  Copyright © 2019 Group Work. All rights reserved.
//

import Foundation

struct MusicItems: Codable {
    let results: [MusicItem]?
    let resultCount: Int?
}
struct MusicItem: Codable {
    var artistName: String!
    var trackName: String!
    var artworkUrl100: String!
    var previewUrl: String!
}
