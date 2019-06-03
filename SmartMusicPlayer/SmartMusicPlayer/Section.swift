//
//  Section.swift
//  SmartMusicPlayer
//
//  Created by macOSHighSierra1036 on 6/3/19.
//  Copyright © 2019 Group Work. All rights reserved.
//

import Foundation


struct Section {
    var name: String!
    var songType: [String]!
    var expanded: Bool!
    
    init(name: String, songType: [String], expanded: Bool) {
        self.name = name
        self.songType = songType
        self.expanded = expanded
    }
}

